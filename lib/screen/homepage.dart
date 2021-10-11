import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/Models/categoria.dart';
import 'package:progdrinks/Models/drink.dart';


import 'package:progdrinks/screen/cocktails.dart';
import 'package:progdrinks/screen/drawer.dart';

import 'package:simple_animations/simple_animations.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.categorie, required this.drinks});

  final List<Categoria> categorie;
  final List<Drink> drinks;


  @override
  _HomePageState createState() => _HomePageState();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class _HomePageState extends State<HomePage> {
  var colorebello = false;
  var zio = false;
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawers(),
        extendBodyBehindAppBar: true,
        appBar: buildAppBar(),
        body: buildBodyStyle());
  }

  /*StreamBuilder(
            stream: bloc.streamCategoria,
            builder: (context, risultatoDelloStream) {
              if (risultatoDelloStream.hasData) {
                List<Categoria> categorie = risultatoDelloStream.data;
                var luoghi = categorie
                    .map((Categoria c) => c.luoghi)
                    .toList()
                    .expand((e) => e)
                    .toList();
                return */
//buildBodyStyle(),
  buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Builder(
        builder: (context) {
          return Container(
            height: 60,
            width: 60,
            decoration: new BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.4),
                borderRadius: new BorderRadius.all(Radius.circular(20))),
            alignment: Alignment.center,
            child: IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.amber,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          );
        },
      ),
    );
  }

  buildBodyStyle() {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xff000029),
          backgroundBlendMode: BlendMode.srcOver,
        ),
        child: PlasmaRenderer(
            type: PlasmaType.infinity,
            particles: 10,
            color: Color(0x44e45a23),
            blur: 0.2,
            size: 0.30,
            speed: 2,
            offset: 0,
            blendMode: BlendMode.plus,
            particleType: ParticleType.atlas,
            variation1: 0,
            variation2: 0,
            variation3: 0,
            rotation: 0,
            child: bodyMainContent()));
  }

  bodyMainContent() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          firstSectionBody(),
          secondSectionBody(),
        ],
      ),
    );
  }

  firstSectionBody() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Image.network(
                  'https://www.labarbieriadimilano.it/images/18_immagine.jpg',
                  fit: BoxFit.fitHeight,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
              ),
              Container(
                  color: Colors.transparent.withOpacity(0.3),
                  child: Center(

                    //funnnzioooooooooooooooooooooooooona porco di un dio
                    
                    child: Text(widget.categorie[0].titolo,
                        style: TextStyle(color: Colors.amber, fontSize: 30)),
                  ))
            ]),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: new BoxDecoration(
                          color: Colors.blueGrey.withOpacity(0.4),
                          borderRadius:
                              new BorderRadius.all(Radius.circular(20))),
                      height: 75,
                      width: 100,
                      child: Icon(
                        Icons.search_sharp,
                        size: 50,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: new BoxDecoration(
                          color: Colors.blueGrey.withOpacity(0.4),
                          borderRadius:
                              new BorderRadius.all(Radius.circular(20))),
                      height: 75,
                      width: 100,
                      child: Icon(
                        Icons.favorite,
                        size: 50,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  secondSectionBody() {
    return Expanded(
      child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              firstColumnSection(),
              secondColumnSection(),
            ],
          )),
    );
  }

  firstColumnSection() {
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: imgList
          .map((item) => GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CockTailsPage()));
                },
                child: Stack(children: [
                  Center(
                      child: Image.network(item,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width)),
                  Container(
                    color: Colors.transparent.withOpacity(0.3),
                    child: Center(
                      child: Text(
                        'Nome Categorie ',
                        style: TextStyle(fontSize: 30, color: Colors.amber),
                      ),
                    ),
                  )
                ]),
              ))
          .toList(),
    );
  }

  secondColumnSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imgList.asMap().entries.map((entry) {
        return GestureDetector(
          child: Container(
            width: 12.0,
            height: 12.0,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.amber)
                    .withOpacity(_current == entry.key ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }
}
