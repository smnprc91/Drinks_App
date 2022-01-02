import 'package:flutter/material.dart';
import 'package:progdrinks/screen/firsttime%20introduction/firstStartingPage.dart';
import 'package:progdrinks/screen/homepage.dart';
import 'package:progdrinks/themes/theme-gold.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: goldTheme,
        home: isviewed != 0 ? FirstStartingPage() : HomePage());
  }
}
