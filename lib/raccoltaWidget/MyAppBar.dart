import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({ Key? key }) : super(key: key);
 @override
  Size get preferredSize => const Size.fromHeight(80);
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
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
                Icons.home_filled,
                color: Colors.amber,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
    );
  }
}