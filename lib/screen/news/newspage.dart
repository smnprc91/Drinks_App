import 'package:flutter/material.dart';
import 'package:progdrinks/Models/news.dart';
import 'package:progdrinks/raccoltaWidget/MyAppBar.dart';
import 'package:progdrinks/raccoltaWidget/MyBodyStyle.dart';

//TODO bisogna aggiornare la grafica e testare le dimensioni 

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
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
         
            child: MyBodyStyle(
                child: Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.20),
                  
                  child: Container(
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: buildnote(),
                  ),
              ),
            ),
                ))));
  }

  List<Widget> buildnote() {
    return widget.news.note.map((note) {
      return
      
      
      
      
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.blueGrey,
                      width: 1,
                    ),
                  ),
                  child:  Text(note,
            style: TextStyle(
              fontSize: 30, color: Colors.white
            )),
                  ),
      );
      
      
      
      
      
      
      
      
    }).toList();
  }
}
