import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/models/drinksofday.dart';
import 'package:progdrinks/widgets/mycard.dart';

class DodStepsSection extends StatefulWidget {
  const DodStepsSection({Key? key, required this.daydrink}) : super(key: key);
  final DayDrinks daydrink;
  @override
  _DodStepsSectionState createState() => _DodStepsSectionState();
}

class _DodStepsSectionState extends State<DodStepsSection> {
  @override
  Widget build(BuildContext context) {
    return MyCard(
      value: 8.0,
      child: Column(
        children: [
          _stepsTitle(),
          _stepsList(widget.daydrink),
        ],
      ),
    );
  }

  _stepsTitle() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AutoSizeText(
          'Procedimento :',
          style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).secondaryHeaderColor,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  _stepsList(daydrink) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listastep(daydrink),
    );
  }

  List<Widget> listastep(DayDrinks daydrink) {
    return widget.daydrink.steps.map((step) {
      return MyCard(
        value: 10,
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 0.0, bottom: 4),
              child: AutoSizeText(step,
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 15)),
            )),
      );
    }).toList();
  }
}
