import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/bloc/bloc.dart';
import 'package:progdrinks/models/categoria.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/screen/cocktails/cocktails.dart';
import 'package:progdrinks/screen/drawer/drawer.dart';
import 'package:progdrinks/widgets/myappbar.dart';
import 'package:progdrinks/screen/mydrinkofdaysection.dart';
import 'package:progdrinks/widgets/mysearchbutton.dart';

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
    return Scaffold(
        drawer: Drawers(),
        extendBodyBehindAppBar: true,
        appBar: MyAppBar(),
        body: StreamBuilder(
            stream: bloc.streamCategoria,
            builder: (context, risultatoDelloStream) {
              if (risultatoDelloStream.hasData) {
                List<Categoria> categorie =
                    risultatoDelloStream.data as List<Categoria>;

                var drinks= categorie
                .map((Categoria c) => c.drinks)
                .toList()
                .expand((e) => e)
                .toList();
            

                inspect(drinks);
                return bodyMainContent(categorie, drinks);
              } else {
                return Container(
                    child: Center(child: CircularProgressIndicator()));
              }
            }));
  }

  bodyMainContent(List<Categoria> categorie,drinks ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          firstSectionBody(drinks),
          secondSectionBody(categorie),
        ],
      ),
    );
  }

  firstSectionBody(List<Drink>drinks) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          MyDrinkOfDay(),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MySearchButton(drinks: drinks),
                //   MyFavButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  secondSectionBody(List<Categoria> categorie) {
    return Expanded(
      child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              firstColumnSection(categorie),
            ],
          )),
    );
  }

  firstColumnSection(List<Categoria> categorie) {
    return CarouselSlider.builder(
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
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black.withOpacity(0.5),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            categorie[index].titolo,
                            style: TextStyle(fontSize: 30, color: Colors.amber),
                          ),
                        ),
                      ),
                    ))
              ]),
            ),
          );
        });
  }
}
