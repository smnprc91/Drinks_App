import 'package:flutter/material.dart';
import 'package:progdrinks/screen/homepage.dart';
import 'package:progdrinks/screen/mailform/mailform.dart';
import 'package:progdrinks/screen/pagina%20favoriti/FavScreen.dart';

Map<String, WidgetBuilder> customRoutes = <String, WidgetBuilder>{
  HomePage.routeName: (context) => HomePage(categorie: [], drinks: []), // TODO: change this
  EmailSender.routeName: (context) => EmailSender(),
  FavScreen.routeName: (context) => FavScreen(),
};