import 'package:flutter/material.dart';
import 'package:progdrinks/Models/drinksofday.dart';

class DodScreen extends StatefulWidget {
  const DodScreen({Key? key, required this.daydrink}) : super(key: key);
  final DayDrinks daydrink;
  @override
  _DodScreenState createState() => _DodScreenState();
}
//TODO: finire di integrare i dati dal model e creare la grafica
class _DodScreenState extends State<DodScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text(widget.daydrink.titolo),);
  }
}
