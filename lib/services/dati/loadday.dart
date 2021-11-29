import 'package:flutter/material.dart';
import 'package:progdrinks/screen/dod/dodscreen.dart';
import 'package:progdrinks/services/xmldod.dart';

class LoadDay extends StatefulWidget {
  const LoadDay({Key? key}) : super(key: key);

  @override
  _LoadDayState createState() => _LoadDayState();
}

class _LoadDayState extends State<LoadDay> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: XmlFetchService.fetchDrinkdayXml(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return DodScreen(daydrink: snapshot.data);
          } else {
            return Container();
          }
        });
  }
}
