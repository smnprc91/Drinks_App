import 'package:flutter/material.dart';

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
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_sharp,
              size: 50,
              color: Colors.amber,
            ),
            Icon(
              Icons.search_sharp,
              size: 50,
              color: Colors.amber,
            ),
            Icon(
              Icons.search_sharp,
              size: 50,
              color: Colors.amber,
            ),
            Icon(
              Icons.search_sharp,
              size: 50,
              color: Colors.amber,
            ),
            Icon(
              Icons.search_sharp,
              size: 50,
              color: Colors.amber,
            ),
            Icon(
              Icons.search_sharp,
              size: 50,
              color: Colors.amber,
            ),
            Icon(
              Icons.search_sharp,
              size: 50,
              color: Colors.amber,
            ),
            Icon(
              Icons.search_sharp,
              size: 50,
              color: Colors.amber,
            ),
            Icon(
              Icons.search_sharp,
              size: 50,
              color: Colors.amber,
            ),
            Icon(
              Icons.search_sharp,
              size: 50,
              color: Colors.amber,
            ),
            Icon(
              Icons.search_sharp,
              size: 50,
              color: Colors.amber,
            ),
          ],
        ),
      ),
    ),
  );
  }
}


