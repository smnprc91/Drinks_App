import 'package:auto_animated/auto_animated.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:progdrinks/bloc/blocingr.dart';
import 'package:progdrinks/models/ingrediente.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/mycard.dart';
import 'package:progdrinks/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  BlocCart _favouriteBloc = BlocCart();
  @override
  void initState() {
    _favouriteBloc.loadSavedDataCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _favouriteBloc.streamcartingr,
        builder: (context, risultatoDelloStream) {
          if (risultatoDelloStream.hasData) {
            List<Ingrediente> ingredienti =
                risultatoDelloStream.data as List<Ingrediente>;

            if (ingredienti.length == 0) {
              return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: MyAllPagesAppBar(child: _title()),
                body: Container(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Center(
                          child: MyCard(
                        value: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AutoSizeText(
                            'Hey sembra che tu non abbia niente da comprare!',
                            style: TextStyle(
                                color: Theme.of(context).secondaryHeaderColor),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            minFontSize: 17,
                          ),
                        ),
                      )),
                    ),
                  ),
                ),
              );
            } else {
              final options = LiveOptions(
                delay: Duration(milliseconds: 100),
                showItemInterval: Duration(milliseconds: 100),
                showItemDuration: Duration(milliseconds: 200),
                visibleFraction: 0.05,
                reAnimateOnVisibility: false,
              );

              Widget buildAnimatedItem(
                BuildContext context,
                int index,
                Animation<double> animation,
              ) {
                return FadeTransition(
                    opacity: Tween<double>(
                      begin: 0,
                      end: 1,
                    ).animate(animation),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(-0.5, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      // Paste you Widget
                      child: MyCard(
                        value: 1,
                        child: ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 25,
                              backgroundImage: CachedNetworkImageProvider(
                                  ingredienti[index].img)),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ingredienti[index].nome,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                              ),
                              IconButton(
                                  onPressed: () {
                                    _favouriteBloc.removeFavouriteing(
                                        ingredienti[index].ingrid);
                                  },
                                  icon: Icon(Icons.remove_shopping_cart,
                                      color: Colors.red))
                            ],
                          ),
                        ),
                      ),
                    ));
              }

              return Scaffold(
                  extendBodyBehindAppBar: false,
                  appBar: MyAllPagesAppBar(
                    child: _title(),
                  ),
                  body: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: GestureDetector(
                            onTap: () {
                              pippo();
                              _launchURL();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  'Trova il negozio pi?? vicino a te',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor),
                                ),
                                Icon(
                                  Icons.map_outlined,
                                  color: Colors.amber,
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: LiveList.options(
                            options: options,
                            itemBuilder: buildAnimatedItem,
                            scrollDirection: Axis.vertical,
                            itemCount: ingredienti.length,
                          ),
                        )
                      ],
                    ),
                  ));
            }
          } else {
            return Text('');
          }
        });
  }

  _title() {
    return MyText(child: 'Lista della spesa');
  }

  void _launchURL() async {
    String _url =
        'https://www.google.it/maps/search/Alimentari/MY+Location/data=!4m5!2m4!5m2!2e1!10e2!6e6';

    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  pippo() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    // ignore: unused_local_variable
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }
}
