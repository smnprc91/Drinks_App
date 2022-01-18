import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progdrinks/screen/firsttime%20introduction/firstStartingPage.dart';
import 'package:progdrinks/screen/homepage.dart';
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
        home: isViewed());
  }

  isViewed() {
    if (isviewed != 0) {
      return FirstStartingPage();
    } else {
      return HomePage();
    }
  }
}
//  isviewed != 0 ? FirstStartingPage() : HomePage());
