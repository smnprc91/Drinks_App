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

class _HomePageState extends State<HomePage> {
  var colorebello = false;
  var zio = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawers(),
        extendBodyBehindAppBar: true,
        appBar: buildAppBar(),
        body: buildBodyStyle());
  }

 
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

                    child: Text('roba bella',
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
            ],
          )),
    );
  }

  firstColumnSection() {
    return CarouselSlider.builder(
        itemCount: widget.categorie.length,
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CockTailsPage( drinks: widget.categorie[index].drinks,)));
            },
            child: Stack(children: [
              Center(
                  child: Image.network(widget.categorie[index].img,
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
                          widget.categorie[index].titolo,
                          style: TextStyle(fontSize: 30, color: Colors.amber),
                        ),
                      ),
                    ),
                  ))
            ]),
          );
        });
  }
}
