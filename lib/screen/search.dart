import 'package:flutter/material.dart';
import 'package:progdrinks/Models/categoria.dart';
import 'package:progdrinks/Models/drink.dart';
import 'package:progdrinks/bloc/block.dart';
import 'package:simple_animations/simple_animations.dart';

import 'details.dart';

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
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
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
            child: buildbodystyle(),
          )),
    );
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
            child: ListView.buil
            der(
       padding: EdgeInsets.zero,
          itemCount: widget.drinks.length,
          itemBuilder: (context, index) {
            return widget.drinks[index].titolo
                    .toLowerCase()
                    .contains(drinkcercato)
                ? GestureDetector(
                    onTap: () {
                      Bloc().sinkDrinkSelezionato.add(widget.drinks[index]);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(
                                    drink: widget.drinks,
                                    index: index.toString(),
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
