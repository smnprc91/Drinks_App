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
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Search(
                      drinks: widget.drinks,
                    )));
      },
      child: Icon(
        Icons.search_sharp,
     
        color: Colors.amber,
      ),
    );
  }
}
