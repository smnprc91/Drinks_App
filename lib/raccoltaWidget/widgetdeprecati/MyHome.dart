import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(
        Icons.home,
        size: 30,
        color: Colors.amber,
      ),
      label: Text(
        'Home',
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
