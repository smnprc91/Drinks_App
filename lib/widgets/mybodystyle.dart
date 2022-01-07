import 'package:flutter/material.dart';



class MyBodyStyle extends StatefulWidget {
  const MyBodyStyle({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  _MyBodyStyleState createState() => _MyBodyStyleState();
}

class _MyBodyStyleState extends State<MyBodyStyle> {
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Theme.of(context).primaryColor,
       child: widget.child,);
  }
}
