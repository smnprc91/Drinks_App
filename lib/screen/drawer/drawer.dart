import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/screen/detailsscreen/favscreen.dart';
import 'package:progdrinks/screen/drawer/draweritem.dart';

import 'package:progdrinks/screen/mailform/mailform.dart';
import 'package:progdrinks/screen/news/newspage.dart';

class Drawers extends StatelessWidget {
  Drawers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).secondaryHeaderColor,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.7,
              child: ListView(
                children: [
                  _buildDrawerHeader(context),
                  _homeButton(context),
                  ..._drawerItems,
                
                ],
              ),
            ),
            _version(context)
          ],
        ),
      ),
    );
  }

  DrawerHeader _buildDrawerHeader(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/drawer.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("DrinkIt",
                style: Theme.of(context).primaryTextTheme.headline5),
          )
        ]));
  }

  _homeButton(context) {
    return ListTile(
      title: Text(
        'home',
      ),
      leading: Icon(
        Icons.home,
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  final List<DrawerItem> _drawerItems = [
    DrawerItem(name: 'Preferiti', icon: Icons.favorite, routeName: FavScreen()),
    DrawerItem(
        name: 'Contattaci',
        icon: Icons.contact_phone,
        routeName: EmailSender()),
    DrawerItem(
        name: 'news', icon: Icons.new_label_sharp, routeName: NewsPage()),
  ];

  _version(context) {
    return Container(
  
      height: MediaQuery.of(context).size.height * 0.30,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height*0.08,
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText('Versione:  0.1',style: TextStyle(color: Colors.white),),
              ),
            
            ],),
          ),
        ),
      ),
    );
  }
}
