import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:progdrinks/models/drinksofday.dart';
import 'package:progdrinks/services/xmldod.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/mybodystyle.dart';

class DodScreen extends StatefulWidget {
  @override
  _DodScreenState createState() => _DodScreenState();
}
//TODO: finire di integrare i dati dal model e creare la grafica

class _DodScreenState extends State<DodScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: XmlFetchService.fetchDrinkdayXml(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            DayDrinks daydrink = snapshot.data;
            return Scaffold(
                appBar: MyAllPagesAppBar(),
                body: MyBodyStyle(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.036),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.blueGrey,
                                width: 1,
                              ),
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(
                                daydrink.img,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          daydrink.titolo,
                          style: TextStyle(fontSize: 30, color: Colors.amber),
                        ),
                      ),
                  Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        color: Colors.black.withOpacity(0.3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Difficoltà : ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Container(
                              width: 150,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: daydrink.difficolta,
                                  itemBuilder: (context, index) {
                                    return Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        color: Colors.black.withOpacity(0.3),
                        child: Center(
                            child: Text(
                          'Ingredienti',
                          style: TextStyle(fontSize: 20, color: Colors.amber),
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.blueGrey,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: listaingredienti(daydrink),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        color: Colors.black.withOpacity(0.3),
                        child: Center(
                            child: Text(
                          'Procedimento',
                          style: TextStyle(fontSize: 20, color: Colors.amber),
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.blueGrey,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: listastep(daydrink),
                        ),
                      )
                    ],
                  ),
                )));
          } else {
            return Container(
              color: Colors.white,
              child: Center(child: CircularProgressIndicator()));
          }
        });
  }

  List<Widget> listaingredienti(DayDrinks daydrink) {
    return daydrink.ingredienti.map((ingrediente) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            ingrediente,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> listastep(DayDrinks daydrink) {
    return daydrink.steps.map((step) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Text(step, style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      );
    }).toList();
  }
}
