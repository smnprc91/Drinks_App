import 'package:flutter/material.dart';
import 'package:progdrinks/services/dati/update.dart';

class MyNews extends StatelessWidget {
  const MyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(
        Icons.campaign_rounded,
        size: 30,
        color: Colors.amber,
      ),
      label: Text(
        'Rimani Aggiornato',
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Update()));
      },
    );
  }
}
