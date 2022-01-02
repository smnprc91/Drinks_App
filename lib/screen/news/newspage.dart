import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/models/news.dart';
import 'package:progdrinks/services/xml.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/mybodystyle.dart';
import 'package:progdrinks/widgets/text.dart';

//TODO bisogna aggiornare la grafica e testare le dimensioni

class NewsPage extends StatefulWidget {

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: XmlFetchService.fetchNoteXml(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            News news = snapshot.data;
            return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: MyAllPagesAppBar(
                  child: _title(),
                ),
                body: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: MyBodyStyle(
                        child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.20),
                      child: Container(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(children: [
                            ...buildnote(news),
                          ]),
                        ),
                      ),
                    ))));
          } else {
            return Container(
              color: Colors.white,
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }

  List<Widget> buildnote(News news) {
    return news.note.map((note) {
      return Card(
          elevation: 9,
          child: ListTile(
            title: AutoSizeText(
              note,
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ));
    }).toList();
  }

  _title() {
    return MyText(child: 'News Blog');
  }
}
