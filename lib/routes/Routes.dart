import 'package:flutter/material.dart';
import 'package:progdrinks/screen/detailsscreen/favscreen.dart';
import 'package:progdrinks/screen/homepage.dart';
import 'package:progdrinks/screen/mailform/mailform.dart';
import 'package:progdrinks/screen/news/newspage.dart';


Map<String, WidgetBuilder> customRoutes = <String, WidgetBuilder>{
  HomePage.routeName: (context) => HomePage(),
  EmailSender.routeName: (context) => EmailSender(),
  FavScreen.routeName: (context) => FavScreen(),
  NewsPage.routeName: (context) =>NewsPage(),
};