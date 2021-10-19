import 'package:flutter/material.dart';
import 'package:progdrinks/screen/drawer/mailform.dart';
import 'package:progdrinks/services/dati/update.dart';

class Drawers extends StatelessWidget {
  const Drawers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent.withOpacity(0.5),
      ),
      child: Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
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
              ),
              TextButton.icon(
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EmailSender()));
                },
              ),
              TextButton.icon(
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Update()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
