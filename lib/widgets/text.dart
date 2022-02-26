import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({Key? key, required this.child}) : super(key: key);
  final String child;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
     child,
      style: TextStyle(
           color: Colors.amber, fontWeight: FontWeight.bold),
    );
  }
}
