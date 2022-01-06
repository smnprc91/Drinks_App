import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/bloc/blocfav.dart';
import 'package:progdrinks/screen/detailsscreen/details.dart';
import 'package:progdrinks/widgets/FavouriteButton.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/text.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({
    Key? key,
  }) : super(key: key);
  static const String routeName = 'favourites';

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

            return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: MyAllPagesAppBar(
                  child: _title(),
                ),
                body: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: ListView.builder(
                        itemCount: drinks.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dettaglio(
                                            drink: drinks[index],
                                          )));
                            },
                            child: Card(
                              elevation: 19,
                              child: ListTile(
                                leading: CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        CachedNetworkImageProvider(
                                            drinks[index].img)),
                                title: Padding(
                                  padding: const EdgeInsets.only(left :0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    AutoSizeText(drinks[index].titolo),FavouriteButton(
                                      drinkid: drinks[index].drinkid , titolo: drinks[index].titolo,),
                                  ],),
                                ),
                             
                                
                              ),
                            ),
                          );
                        })));
          } else {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: MyAllPagesAppBar(child: _title()),
              body: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                      child: AutoSizeText(
                    'Hey sembra che tu non abbia ancora dei drink preferiti!',
                    style: TextStyle(color: Colors.black45),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    minFontSize: 30,
                  )),
                ),
              ),
            );
          }
        });
  }

  _title() {
    return MyText(child: 'Favoriti');
  }
}
