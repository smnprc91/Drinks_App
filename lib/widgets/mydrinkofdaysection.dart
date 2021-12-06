import 'package:flutter/material.dart';
import 'package:progdrinks/services/data/loadday.dart';



//TODO: manca ancora questa pagina
class MyDrinkOfDay extends StatefulWidget {
  const MyDrinkOfDay({ Key? key }) : super(key: key);

  @override
  _MyDrinkOfDayState createState() => _MyDrinkOfDayState();
}

class _MyDrinkOfDayState extends State<MyDrinkOfDay> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
             onTap: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => LoadDay()
      ),
    );
      },
          child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.blueGrey,
                width: 1,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Image.network(
              'https://www.labarbieriadimilano.it/images/18_immagine.jpg',
              fit: BoxFit.fitHeight,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),
          Container(
              color: Colors.transparent.withOpacity(0.3),
              child: Center(
              
        
                child: Text('Drink of the day',
                    style: TextStyle(color: Colors.amber, fontSize: 30)),
              ))
              ]),
            ),
        ));
  }
}