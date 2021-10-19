import 'package:flutter/material.dart';
import 'package:progdrinks/Models/news.dart';
import 'package:simple_animations/simple_animations.dart';

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
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xff000029),
              backgroundBlendMode: BlendMode.srcOver,
            ),
            child: PlasmaRenderer(
                type: PlasmaType.infinity,
                particles: 10,
                color: Color(0x44e45a23),
                blur: 0.4,
                size: 0.30,
                speed: 2,
                offset: 0,
                blendMode: BlendMode.plus,
                particleType: ParticleType.atlas,
                variation1: 0,
                variation2: 0,
                variation3: 0,
                rotation: 0,
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
