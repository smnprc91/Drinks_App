import 'package:flutter/material.dart';
import 'package:progdrinks/screen/firstStartingPage.dart';
import 'package:progdrinks/screen/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;
void main() async {
  //CIAONE
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isviewed != 0 ? FirstStartingPage() : HomePage(),
    );
  }
}
