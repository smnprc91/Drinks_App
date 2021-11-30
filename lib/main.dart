import 'package:flutter/material.dart';
import 'package:progdrinks/screen/firsttime%20introduction/firstStartingPage.dart';
import 'package:progdrinks/services/dati/load.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

//TODO: inserire nel server i dati giusti , formattare gli xml , scegliere un formatto per le foto, e creare una cartella per le foto
//TODO:aggiungere la possibilità di switchare il tema dell'app , il bottone va inserito nel drawer.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: isviewed != 0 ? FirstStartingPage() : Load());
  }
}
