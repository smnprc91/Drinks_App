import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBarHome extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBarHome({ Key? key }) : super(key: key);
 @override
  Size get preferredSize => const Size.fromHeight(80);
  @override
  _MyAppBarHomeState createState() => _MyAppBarHomeState();
}

class _MyAppBarHomeState extends State<MyAppBarHome> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Builder(
        builder: (context) {
          return Container(
            height: 60,
            width: 60,
            decoration: new BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.4),
                borderRadius: new BorderRadius.all(Radius.circular(20))),
            alignment: Alignment.center,
            child: IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.amber,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          );
        },
      ),
    );
  }
}



