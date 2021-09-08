import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  return displaySize(context).width;
}

class _HomePageState extends State<HomePage> {
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/test.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  var _color = Colors.amberAccent;
  double _height = 100;
  var _color2 = Colors.amberAccent;
  double _height2 = 0;
  var _color3 = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: listview()),
          ],
        ),
      ),
    );
  }

  listview() {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return listtile(index);
      },
    );
  }

  listtile(index) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print('object');
            setState(() {
              _color = Colors.greenAccent;
              _height = displayHeight(context) * 0.2;
              _color2 = Colors.greenAccent;
              _height2 = displayHeight(context) * 0.2;
              _color3 = Colors.black;
            });
          },
          child: AnimatedContainer(
              height: _height,
              width: displayWidth(context),
              decoration: BoxDecoration(
                color: _color,
              ),
              duration: const Duration(seconds: 1),
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text('qui va passata l immagine')),
        ),
        AnimatedContainer(
          width: displayWidth(context),
          height: _height2,
          decoration: BoxDecoration(
            color: _color2,
          ),
          duration: const Duration(seconds: 1),
          margin: EdgeInsets.only(left: 10, right: 10),
          child: ListTile(
            leading: Text(_items[index]["id"]),
            title: Text(_items[index]["name"]),
            subtitle: Text(_items[index]["description"]),
          ),
        ),
        AnimatedContainer(
            width: displayWidth(context),
            height: _height2,
            decoration: BoxDecoration(
              color: _color2,
            ),
            duration: const Duration(seconds: 1),
            margin: EdgeInsets.only(left: 10, right: 10),
            child: IconButton(
                icon: Icon(
                  Icons.arrow_upward,
                  color: _color3,
                ),
                onPressed: () {
                  setState(() {
                    _color = Colors.amberAccent;
                    _height = 100;
                    _color2 = Colors.amberAccent;
                    _height2 = 0;
                    _color3 = Colors.transparent;
                  });
                })),
      ],
    );
  }
}
