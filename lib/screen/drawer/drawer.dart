import 'package:flutter/material.dart';
import 'package:progdrinks/screen/detailsscreen/favscreen.dart';
import 'package:progdrinks/screen/drawer/drawerItem.dart';
import 'package:progdrinks/screen/homepage.dart';
import 'package:progdrinks/screen/mailform/mailform.dart';


class Drawers extends StatelessWidget {
  Drawers({Key? key}) : super(key: key);

  final List<DrawerItem> _drawerItems = [
    DrawerItem(name: 'Home', icon: Icons.home, routeName: HomePage.routeName),
    DrawerItem(
        name: 'Preferiti',
        icon: Icons.favorite,
        routeName: FavScreen.routeName),
    DrawerItem(
        name: 'Contattaci',
        icon: Icons.contact_phone,
        routeName: EmailSender.routeName),
    DrawerItem(name: 'Note', icon: Icons.info_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          _buildDrawerHeader(context),
          ..._drawerItems,
         
        ],
      ),
    );
  }

  DrawerHeader _buildDrawerHeader(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/drawer-bg.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("iDrink",
                style: Theme.of(context).primaryTextTheme.headline5),
          )
        ]));
  }
}
