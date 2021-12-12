import 'package:flutter/material.dart';

class MyAllPagesAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAllPagesAppBar({ Key? key }) : super(key: key);
 @override
  Size get preferredSize => const Size.fromHeight(80);
  @override
  _MyAllPagesAppBarState createState() => _MyAllPagesAppBarState();
}

class _MyAllPagesAppBarState extends State<MyAllPagesAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
    
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
  
    );
  }
}