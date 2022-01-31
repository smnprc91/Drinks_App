import 'package:flutter/material.dart';
import 'package:progdrinks/models/news.dart';
import 'package:progdrinks/services/xml.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isup;

class MyNotificationSistem extends StatefulWidget {
  @override
  _MyNotificationSistemState createState() => _MyNotificationSistemState();
}

class _MyNotificationSistemState extends State<MyNotificationSistem> {
  void initState() {
    ini();
    super.initState();
  }

  void ini() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isup = prefs.getInt('list');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: XmlFetchService.fetchNoteXml(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            News news = snapshot.data;

            int newslist = news.note.length;
            print('newslist');
            print(newslist);
            print('isup');
            print(isup);

            if (isup == null) {
              isup = newslist;
            } else if (isup!.clamp(1, newslist) == isup) {
              isup = newslist;
            } else if (isup! > newslist + 1) {
              isup = newslist;
            }

            if (isup == newslist) {
              return FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor.withRed(30),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    _savedList(news);
                    setState(() {
                      isup = 0;
                    showAlertDialog(context, news);
                    });
                  });
            } else {
              return Container();
            }
          } else {
            return Center();
          }
        });
  }
}

void _savedList(News news) async {
  int isup = news.note.length + 1;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('list', isup);
}

showAlertDialog(BuildContext context, news) {
  // Create button
  Widget okButton = RawMaterialButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Hey ci sono novità!"),
    content: Text(news.note.first),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}




/* isup è lla variabile di controllo che di default è null 
isup alla fine del ciclo di if e alla pressione del bottone andrà a salvare i dati nelle shared prefference
  if (isup == null) {
              isup = newslist;




successivamente si controlla che isup vada da un valore di 1 fino alla lunghezza massima della lista delle news
else if (isup!.clamp(1, newslist) == isup) {
              isup = newslist;



mentre alla fine in caso di perdita di dati dal server è possibile riprendere la routine con questo if
isup! > newslist + 1


ricapitolando isup == null

lista note 2

alla fine ci troveremo così

isup =3
lista note = 2
 *
 */