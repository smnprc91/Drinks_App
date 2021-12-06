import 'package:flutter/material.dart';
import 'package:progdrinks/screen/homepage.dart';

class Load extends StatefulWidget {
  const Load({Key? key}) : super(key: key);

  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => Navigator.of(context).pushReplacementNamed(HomePage.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator()
      )
    );
  }
}
