import 'package:flutter/material.dart';
import 'package:progdrinks/screen/favourites/favscreen.dart';
import 'package:progdrinks/screen/drawer/draweritem.dart';
import 'package:progdrinks/screen/mailform/mailform.dart';
import 'package:progdrinks/screen/news/newspage.dart';
import 'package:progdrinks/screen/shopping/shopping.dart';
import 'package:url_launcher/url_launcher.dart';

class Drawers extends StatelessWidget {
  Drawers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 1,
              child: ListView(
                children: [
                  _buildDrawerHeader(context),
                  _homeButton(context),
                  ..._drawerItems,
                  _receButton(context)
                ],
              ),
            ),
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
                style:
                    TextStyle(color: Theme.of(context).secondaryHeaderColor)),
          )
        ]));
  }

  _homeButton(context) {
    return ListTile(
      title: Text('home',
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor)),
      leading: Icon(Icons.home, color: Theme.of(context).secondaryHeaderColor),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  _receButton(context) {
    return ListTile(
      title: Text('Valuta',
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor)),
      leading: Icon(Icons.edit, color: Theme.of(context).secondaryHeaderColor),
      onTap: () {
        _launchURL();
      },
    );
  }

  void _launchURL() async {
    String _url =
        'https://play.google.com/store/apps/details?id=com.DrinkIt.name';

    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  final List<DrawerItem> _drawerItems = [
    DrawerItem(name: 'Preferiti', icon: Icons.favorite, routeName: FavScreen()),
    DrawerItem(
        name: 'Lista spesa',
        icon: Icons.add_shopping_cart,
        routeName: Shopping()),
    DrawerItem(
        name: 'Contattaci',
        icon: Icons.contact_phone,
        routeName: EmailSender()),
    DrawerItem(
        name: 'News', icon: Icons.new_label_sharp, routeName: NewsPage()),
  ];
}
