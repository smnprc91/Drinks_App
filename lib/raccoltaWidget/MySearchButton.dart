import 'package:flutter/material.dart';
import 'package:progdrinks/Models/categoria.dart';
import 'package:progdrinks/Models/drink.dart';
import 'package:progdrinks/screen/search.dart';

class MySearchButton extends StatefulWidget {
  const MySearchButton(
      {Key? key, required this.categorie, required this.drinks})
      : super(key: key);

  final List<Categoria> categorie;
  final List<Drink> drinks;
  @override
  _MySearchButtonState createState() => _MySearchButtonState();
}

class _MySearchButtonState extends State<MySearchButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Search(
                          categorie: widget.categorie,
                          drinks: widget.drinks,
                        )));
          },
          child: Container(
            decoration: new BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.4),
                borderRadius: new BorderRadius.all(Radius.circular(20))),
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
    );
  }
}
