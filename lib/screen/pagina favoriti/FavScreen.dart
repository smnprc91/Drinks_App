import 'package:flutter/material.dart';
import 'package:progdrinks/Models/drink.dart';
import 'package:progdrinks/bloc/blocfav.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({Key? key, required this.drinks}) : super(key: key);

  final List<Drink> drinks;
  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  final Bloc bloc = new Bloc();
  var index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.amber,
            child: ListView.builder(
                itemCount: widget.drinks.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      /**  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dettaglio(
                                        drink: widget.drinks[index] ,
                                      ))); */
                    },
                    child: ListTile(
                      title: GestureDetector(
                          child: Text(widget.drinks[index].titolo)),
                    ),
                  );
                })));
  }
}
