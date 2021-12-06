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
    
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
  
    );
  }
}