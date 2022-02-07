import 'package:flutter/material.dart';

class MyCircularProgressIndicator extends StatelessWidget {
  const MyCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.amber,
        ),
      ),
    );
  }
}
