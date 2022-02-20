import 'package:auto_animated/auto_animated.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/bloc/blocfav.dart';
import 'package:progdrinks/screen/detailsscreen/details.dart';
import 'package:progdrinks/widgets/FavouriteButton.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/mycard.dart';
import 'package:progdrinks/widgets/text.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({
    Key? key,
  }) : super(key: key);
  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  Bloc _favouriteBloc = Bloc();
  @override
  void initState() {
    _favouriteBloc.loadSavedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _favouriteBloc.streamFavdrink,
        builder: (context, risultatoDelloStream) {
          if (risultatoDelloStream.hasData) {
            List<Drink> drinks = risultatoDelloStream.data as List<Drink>;

            if (drinks.length == 0) {
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
                            'Hey sembra che tu non abbia ancora dei drink preferiti!',
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
              drinks.sort((a, b) => a.titolo.compareTo(b.titolo));
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dettaglio(
                                          drink: drinks[index],
                                        )));
                          },
                          child: MyCard(
                            value: 1,
                            child: ListTile(
                              leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 25,
                                  backgroundImage: CachedNetworkImageProvider(
                                      drinks[index].img)),
                              title: Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      drinks[index].titolo,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .secondaryHeaderColor),
                                    ),
                                    FavouriteButton(
                                      color: Theme.of(context).primaryColor,
                                      drinkid: drinks[index].drinkid,
                                      titolo: drinks[index].titolo,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )));
              }

              return Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: MyAllPagesAppBar(
                    child: _title(),
                  ),
                  body: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Container(
                          child: LiveList.options(
                            options: options,
                            itemBuilder: buildAnimatedItem,
                            scrollDirection: Axis.vertical,
                            itemCount: drinks.length,
                          ),
                        ),
                      )));
            }
          } else {
            return Text('');
          }
        });
  }

  _title() {
    return MyText(child: 'Preferiti');
  }
}
