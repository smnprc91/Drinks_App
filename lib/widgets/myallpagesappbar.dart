import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAllPagesAppBar extends StatefulWidget implements PreferredSizeWidget {
   MyAllPagesAppBar({Key? key,  required this.child}) : super(key: key);
  final Widget child;
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  _MyAllPagesAppBarState createState() => _MyAllPagesAppBarState();
}

class _MyAllPagesAppBarState extends State<MyAllPagesAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget.child,
      iconTheme: IconThemeData(color: Colors.amber),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
    );
  }
}
