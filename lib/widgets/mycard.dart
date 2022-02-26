import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  const MyCard({Key? key, required this.child, required this.value})
      : super(key: key);
  final Widget child;
  final double value;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Theme.of(context).primaryColor.withRed(30),
      child:
          Padding(padding: EdgeInsets.all(widget.value), child: widget.child),
    );
  }
}
