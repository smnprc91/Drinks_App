import 'package:flutter/material.dart';
import 'package:progdrinks/screen/mailform/mailform.dart';

class Mycontatti extends StatelessWidget {
  const Mycontatti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(
        Icons.send,
        size: 30,
        color: Colors.amber,
      ),
      label: Text(
        'Contattaci',
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EmailSender()));
      },
    );
  }
}
