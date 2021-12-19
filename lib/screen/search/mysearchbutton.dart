import 'package:flutter/material.dart';
import 'package:progdrinks/models/drink.dart';

import 'package:progdrinks/screen/search/search.dart';

class MySearchButton extends StatefulWidget {
  const MySearchButton({Key? key, required this.drinks}) : super(key: key);

  final List<Drink> drinks;
  @override
  _MySearchButtonState createState() => _MySearchButtonState();
}

class _MySearchButtonState extends State<MySearchButton> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.search_sharp,
      size: 30,
     
      color: Colors.amber,
    );
  }
}
