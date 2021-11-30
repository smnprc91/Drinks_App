import 'package:flutter/material.dart';
import 'package:progdrinks/Models/drinksofday.dart';
import 'package:progdrinks/raccoltaWidget/MyBodyStyle.dart';

class DodScreen extends StatefulWidget {
  const DodScreen({Key? key, required this.daydrink}) : super(key: key);
  final DayDrinks daydrink;
  @override
  _DodScreenState createState() => _DodScreenState();
}
//TODO: finire di integrare i dati dal model e creare la grafica
class _DodScreenState extends State<DodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MyBodyStyle(
            child: SingleChildScrollView(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      widget.daydrink.img,
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.daydrink.titolo,
                style: TextStyle(fontSize: 30, color: Colors.amber),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Difficoltà : ' + widget.daydrink.difficolta,
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
                children: listaingredienti(),
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
                children: listastep(),
              ),
            )
          ],
        ),
      ),
    )));
  }

  List<Widget> listaingredienti() {
    return widget.daydrink.ingredienti.map((ingrediente) {
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

  List<Widget> listastep() {
    return widget.daydrink.steps.map((step) {
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




