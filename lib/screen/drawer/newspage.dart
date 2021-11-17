import 'package:flutter/material.dart';
import 'package:progdrinks/Models/news.dart';
import 'package:progdrinks/raccoltaWidget/MyAppBar.dart';
import 'package:progdrinks/raccoltaWidget/MyBodyStyle.dart';

//questa sezione dell app non è ancora pronta

class NewsPage extends StatefulWidget {
  final News news;
  NewsPage({required this.news});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xff000029),
              backgroundBlendMode: BlendMode.srcOver,
            ),
            child: MyBodyStyle(
                child: Container(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: buildnote(),
                ),
              ),
            ))));
  }

  List<Widget> buildnote() {
    return widget.news.note.map((note) {
      return Text(note,
          style: TextStyle(
            fontSize: 200,
          ));
    }).toList();
  }
}
