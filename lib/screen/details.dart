import 'package:flutter/material.dart';
import 'package:progdrinks/Models/drink.dart';
import 'package:progdrinks/bloc/block.dart';

class Details extends StatefulWidget {
  const Details({required this.drink, required this.index});
  final List<Drink> drink;
  final String index;
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Bloc().streamDrinkSelezionato,
        builder: (context, AsyncSnapshot<Drink> risultatoStream) {
          if (risultatoStream.hasData) {
            return Scaffold(
              body: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Column(
                  children: [
                    Hero(
                        tag: widget.index.toString(),
                        child: Image.network(risultatoStream.data!.img)),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
/** */