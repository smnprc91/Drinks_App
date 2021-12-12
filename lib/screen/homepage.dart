import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/bloc/bloc.dart';
import 'package:progdrinks/models/categoria.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/screen/cocktails/cocktails.dart';
import 'package:progdrinks/screen/dod/dodscreen.dart';
import 'package:progdrinks/screen/drawer/drawer.dart';
import 'package:progdrinks/screen/search/mysearchbutton.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Bloc bloc = new Bloc();

  int currentImage = 0;
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = <TargetFocus>[];

  GlobalKey keyButton = GlobalKey();
  GlobalKey keyButton1 = GlobalKey();
  GlobalKey keyButton2 = GlobalKey();
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
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.white,
                child: Container(
                  key: keyButton2,
                  child: Icon(
                    Icons.priority_high,
                    color: Colors.amber,
                    key: keyButton1,
                  ),
                ),
                onPressed: () {
                  showTutorial();
                },
              ),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(color: Colors.amber),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: MySearchButton(
                      drinks: drinks,
                    ),
                  )
                ],
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
      color: Colors.white,
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
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) => DodScreen()),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                'https://www.labarbieriadimilano.it/images/18_immagine.jpg',
                fit: BoxFit.fitHeight,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.37,
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
                        Icons.arrow_upward_outlined,
                        color: Colors.amber,
                        size: 30,
                      ),
                      AutoSizeText('Drink del giorno',
                          maxLines: 1,
                          minFontSize: 20,
                          style:
                              TextStyle(color: Colors.black45, fontSize: 30)),
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
                      AutoSizeText('Scegli una categoria',
                          maxLines: 1,
                          minFontSize: 20,
                          style:
                              TextStyle(color: Colors.black45, fontSize: 30)),
                      Icon(
                        Icons.arrow_downward_outlined,
                        color: Colors.amber,
                        size: 30,
                      )
                    ],
                  ))),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  caText(
                    categorie,
                  ),
                  style: TextStyle(color: colText(), fontSize: 25),
                ),
              ),
            ),
            CarouselSlider.builder(
                itemCount: categorie.length,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  onPageChanged: (index, fn) {
                    setState(() {
                     currentImage = index;
                    });
                  },
                ),
                itemBuilder: (
                  BuildContext context,
                  int index,
                  int i,
                ) {
                  return Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CockTailsPage(
                                      drinks: categorie[index].drinks,
                                    )));
                      },
                      child: Container(
                        child: CachedNetworkImage(
                          fit: BoxFit.contain,
                          imageUrl: categorie[index].img,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ));
  }

  caText(
    List<Categoria> categorie,
  ) {
    if (currentImage == 0) {
      return categorie[0].titolo;
    } else if (currentImage == 1) {
      return categorie[1].titolo;
    } else {
      return categorie[2].titolo;
    }
  }

  colText() {
    if (currentImage == 0) {
      return Colors.black45;
    } else if (currentImage == 1) {
      return Colors.black45;
    } else {
      return Colors.black45;
    }
  }

  void showTutorial() {
    initTargets();
    tutorialCoachMark = TutorialCoachMark(
      context,
      targets: targets,
      colorShadow: Colors.white.withOpacity(0.5),
      textStyleSkip: TextStyle(color: Colors.black),
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.8,
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
      onSkip: () {
        print("skip");
      },
    )..show();
  }

  void initTargets() {
    targets.clear();
    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation1",
        keyTarget: keyButton1,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     AutoSizeText(
                     
                      "ciao ",
                      minFontSize: 30,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation2",
        keyTarget: keyButton2,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   AutoSizeText(
                     
                      "yo yo yo ",
                      minFontSize: 30,
                      style: TextStyle(
                        
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
