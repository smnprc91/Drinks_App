import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progdrinks/models/drinksofday.dart';
import 'package:progdrinks/screen/firsttime%20introduction/firstStartingPage.dart';
import 'package:progdrinks/screen/homepage.dart';
import 'package:progdrinks/services/xmldod.dart';
import 'package:progdrinks/widgets/mycircular.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xff212529),
            secondaryHeaderColor: Color(0xffb4c4c4)),
        home: FutureBuilder(
          future: XmlFetchService.fetchDrinkdayXml(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              DayDrinks daydrink = snapshot.data;
              return isViewed(daydrink);
            } else {
              return MyCircularProgressIndicator();
            }
          }));
  }

  isViewed(daydrynk) {
    if (isviewed != 0) {
      return FirstStartingPage(daydrink: daydrynk,);
    } else {
      return HomePage(daydrink: daydrynk,);
    }
  }
}

