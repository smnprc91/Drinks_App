import 'package:flutter/material.dart';
import 'package:progdrinks/Models/drink.dart';
import 'package:progdrinks/bloc/block.dart';
import 'package:progdrinks/raccoltaWidget/MyBodyStyle.dart';
import 'package:simple_animations/simple_animations.dart';

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
            var listaIngredienti =
                risultatoStream.data!.ingredienti.map((ingrediente) {
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

            var listaSteps = risultatoStream.data!.steps.map((step) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(step,
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              );
            }).toList();

            return Scaffold(
                body: MyBodyStyle(
              child: piro(risultatoStream, listaIngredienti, listaSteps),
            ));
          } else {
            return Container();
          }
        });
  }

  piro(
    AsyncSnapshot<Drink> risultatoStream,
    List<Padding> listaIngredienti,
    List<Container> listaSteps,
  ) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
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
                child: Hero(
                    tag: widget.index.toString(),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        risultatoStream.data!.img,
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                risultatoStream.data!.titolo,
                style: TextStyle(fontSize: 30, color: Colors.amber),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Difficoltà : ' + risultatoStream.data!.difficolta,
                style: TextStyle(fontSize: 20, color: Colors.blueGrey),
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
                children: listaIngredienti,
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
                children: listaSteps,
              ),
            )
          ],
        ),
      ),
    );
  }
}
/** */