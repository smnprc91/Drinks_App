import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/Models/categoria.dart';
import 'package:progdrinks/Models/drink.dart';
import 'package:progdrinks/raccoltaWidget/MyAppBarHome.dart';
import 'package:progdrinks/raccoltaWidget/MyBodyStyle.dart';
import 'package:progdrinks/raccoltaWidget/MyDrinkOfDaySection.dart';
import 'package:progdrinks/raccoltaWidget/MySearchButton.dart';
import 'package:progdrinks/screen/cocktails.dart';
import 'package:progdrinks/screen/drawer/drawer.dart';






class HomePage extends StatefulWidget {
  HomePage({required this.categorie, required this.drinks});

  final List<Categoria> categorie;
  final List<Drink> drinks;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawers(),
        extendBodyBehindAppBar: true,
        appBar: MyAppBarHome(),
        body:MyBodyStyle(child:  bodyMainContent()));
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
         MyDrinkOfDay(),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
             MySearchButton(categorie:widget.categorie, drinks:widget.drinks),
          //  MyFavButton(),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CockTailsPage(
                            drinks: widget.categorie[index].drinks,
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
            ),
          );
        });
  }
}
