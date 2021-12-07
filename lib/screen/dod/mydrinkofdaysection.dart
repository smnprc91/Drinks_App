import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/screen/dod/dodscreen.dart';

//TODO: manca ancora questa pagina
class MyDrinkOfDay extends StatefulWidget {
  const MyDrinkOfDay({Key? key}) : super(key: key);

  @override
  _MyDrinkOfDayState createState() => _MyDrinkOfDayState();
}

class _MyDrinkOfDayState extends State<MyDrinkOfDay> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.42,
      color: Colors.transparent,
      child: Expanded(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) => DodScreen()),
              );
            },
            child: Stack(
              textDirection: TextDirection.rtl,
              clipBehavior: Clip.hardEdge,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    'https://www.labarbieriadimilano.it/images/18_immagine.jpg',
                    fit: BoxFit.fitHeight,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.34,
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.11,
                        decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(40.0))),
                        child: Center(
                          child: AutoSizeText('Drink of the day',
                              maxLines: 1,
                              minFontSize: 30,
                              style: TextStyle(
                                  color: theme.primaryColor, fontSize: 40)),
                        ))),
              ],
            )
          
            ),
      ),
    );
  }
}
