import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/bloc/bloc.dart';
import 'package:progdrinks/models/categoria.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/screen/cocktails/cocktails.dart';
import 'package:progdrinks/screen/dod/dodscreen.dart';
import 'package:progdrinks/screen/drawer/drawer.dart';

import 'package:progdrinks/screen/search/mysearchbutton.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Bloc bloc = new Bloc();

  @override
  void initState() {
    super.initState();
    bloc.caricaDati();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.streamCategoria,
        builder: (context, risultatoDelloStream) {
          if (risultatoDelloStream.hasData) {
            List<Categoria> categorie =
                risultatoDelloStream.data as List<Categoria>;

            var drinks = categorie
                .map((Categoria c) => c.drinks)
                .toList()
                .expand((e) => e)
                .toList();

            return new Scaffold(
              extendBodyBehindAppBar: true,

              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(color: Colors.amber),
                actions: [MySearchButton(drinks: drinks)],
              ),
              drawer: Drawers(),
              body: bodyMainContent(categorie, drinks),
            );
          } else {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
        });
  }

  bodyMainContent(List<Categoria> categorie, drinks) {
    return Container(
      color: Colors.transparent,

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          firstSectionBody(drinks),
          secondSectionBody(categorie),
        ],
      ),
    );
  }

  firstSectionBody(List<Drink> drinks) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.42,
      color: Colors.transparent,
      child: Stack(
        textDirection: TextDirection.rtl,
        clipBehavior: Clip.hardEdge,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                'https://www.labarbieriadimilano.it/images/18_immagine.jpg',
                fit: BoxFit.fitHeight,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.34,
              ),
            ),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.1,
              right: 0,
              bottom: 0,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.11,
                  decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0))),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.thumb_up,
                        color: Colors.amber,
                        size: 30,
                      ),
                      AutoSizeText('Drink of the day',
                          maxLines: 1,
                          minFontSize: 20,
                          style: TextStyle(color: Colors.black, fontSize: 30)),
                    ],
                  )))),
        ],
      ),
    );
  }

  secondSectionBody(List<Categoria> categorie) {
    return Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.04,
                  bottom: MediaQuery.of(context).size.height * 0.04),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.11,
                  decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0))),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AutoSizeText('scegli una categoria',
                          maxLines: 1,
                          minFontSize: 20,
                          style: TextStyle(color: Colors.black, fontSize: 30)),
                      Icon(
                        Icons.arrow_downward_outlined,
                        color: Colors.amber,
                        size: 30,
                      )
                    ],
                  ))),
            ),
            CarouselSlider.builder(
                itemCount: categorie.length,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (
                  BuildContext context,
                  int index,
                  int i,
                ) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CockTailsPage(
                                    drinks: categorie[index].drinks,
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        border: Border.all(
                          color: Colors.blueGrey,
                          width: 1,
                        ),
                      ),
                      child: Stack(children: [
                        Center(
                            child: Image.network(categorie[index].img,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width)),
                        Container(
                            color: Colors.transparent.withOpacity(0.3),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.black.withOpacity(0.5),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    categorie[index].titolo,
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.amber),
                                  ),
                                ),
                              ),
                            ))
                      ]),
                    ),
                  );
                }),
          ],
        ));
  }
}
