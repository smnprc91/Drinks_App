import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
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
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Text(_items[index]["id"]),
        title: Text(_items[index]["name"]),
        subtitle: Text(_items[index]["description"]),
      ),
    );
  }
}
