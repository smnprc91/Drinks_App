
import 'package:flutter/material.dart';
import 'package:progdrinks/screen/news/newspage.dart';
import 'package:progdrinks/services/xml.dart';


class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: XmlFetchService.fetchNoteXml(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
        
          if (snapshot.hasData) {
            return NewsPage(news: snapshot.data);
          } else {
            return Container();
          }
        });
  }
}
