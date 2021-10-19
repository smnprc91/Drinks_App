import 'package:flutter/material.dart';
import 'package:progdrinks/Models/categoria.dart';
import 'package:progdrinks/Models/drink.dart';

class Search extends StatefulWidget {
  Search({required this.categorie, required this.drinks});

  final List<Categoria> categorie;
  final List<Drink> drinks;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: buildcard(context),
        ),
      ),
    );
  }

  List<Widget> buildcard(BuildContext context) {
    return widget.drinks.map<Widget>((Drink drink) {
      return Center(
        child: Container(
          child: Text(drink.titolo),
        ),
      );
    }).toList();
  }
}
