import 'package:flutter/material.dart';
import 'package:progdrinks/Models/categoria.dart';
import 'package:progdrinks/Models/drink.dart';
import 'package:progdrinks/raccoltaWidget/MyAppBar.dart';
import 'package:progdrinks/raccoltaWidget/MyBodyStyle.dart';

import 'pagine favoriti/dettaglio.dart';

class Search extends StatefulWidget {
  Search({required this.categorie, required this.drinks});

  final List<Categoria> categorie;
  final List<Drink> drinks;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String drinkcercato = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: MyAppBar(),
        body: MyBodyStyle(
          child: buildbodystyle(),
        ));
  }

  buildbodystyle() {
    return Container(
        child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.15,
              left: 10,
              right: 10),
          child: TextField(
            onChanged: (risultatoricerca) {
              setState(() {
                drinkcercato = risultatoricerca.toLowerCase();
              });
            },
            style: TextStyle(color: Colors.white, fontSize: 20),
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.blueGrey, width: 2),
                ),
                labelText: "Cerca",
                hintText: 'Inserisci il nome',
                hintStyle: TextStyle(color: Colors.amber, fontSize: 20),
                labelStyle: TextStyle(color: Colors.amber, fontSize: 25)),
          ),
        ),
        Expanded(
            child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: widget.drinks.length,
          itemBuilder: (context, index) {
            return widget.drinks[index].titolo
                    .toLowerCase()
                    .contains(drinkcercato)
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Dettaglio(
                                    drink: widget.drinks[index],
                                  )));
                    },
                    child: ListTile(
                      title: Center(
                          child: Text(
                        widget.drinks[index].titolo,
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  )
                : Container();
          },
        ))
      ],
    ));
  }
}
