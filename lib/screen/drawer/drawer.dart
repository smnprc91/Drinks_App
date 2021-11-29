import 'package:flutter/material.dart';
import 'package:progdrinks/raccoltaWidget/MYcontatti.dart';
import 'package:progdrinks/raccoltaWidget/MyHome.dart';
import 'package:progdrinks/raccoltaWidget/MyNews.dart';
import 'package:progdrinks/screen/mailform/mailform.dart';
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
            children: [MyHome(), Mycontatti(), MyNews()],
          ),
        ),
      ),
    );
  }
}
