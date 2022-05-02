import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/models/news.dart';
import 'package:progdrinks/services/xml.dart';
import 'package:shared_preferences/shared_preferences.dart';

//in questo widget cerco di creare un sistema di notifiche che lavora insieme ad un xml, che ho hostato su un mio server personale
// il funzionamento di base prevede che nel caso in cui il valore della variavile isup sia uguale a quello della lunghezza (in terminimi di elementi) della lista di notifiche,
//venga mostrata una campanella  cliccabile che se premuta mostrerà sempre l'ultima notifica da me caricata online.
// mentre una volta premuta la campanella essa verrà rimossa dalla schermata e non sarà più visibile nei prossimi avii,
//a meno che non venga caricata una notifica successiva.
// esempio di funzionamento  che verrà ripreso passo passo nel codice

// in questo esempio si analizzerà il primo avvio dopo l'installazione dell'app

/*
  isup;
  //se isup è null (primo avvio)
   if (isup == null) {
            ( isup = newslist; settando questo valore rendo isup uguale alla lunghezza della lista di notifiche ,)
              isup = newslist;
            }

se isup e newslist sono uguali es...

newslist = 5

 il valore di isup  essendo null verrà converito in newslist

 quindi 

 isup =5
 newslist =5

e la ocndizione così verrà resa vera per il prossimo if che è la parte core del funzionamento 
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
                      // isup=0 fa sparire la campanella dalla schermata
                      isup = 0;
                      showAlertDialog(context, news);
                    });
                  });
            } 

ora la parte di saved list fa si isup sia di un unità maggiore di newslist , rendendo appunto il precedente if impossibile da eseguire

void _savedList(News news) async {
  int isup = news.note.length + 1;
  qui isup verrà salvato con le shared in locale
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('list', isup);
}

quindi una volta presa visione della notifica e avendo premuto il bottone che richiama il metodo  savedList(news);

riavviando l'app ci ritroveremo con i seguenti valori 

newslist =5

isup = 6

rendendo appunto impossibile l'if che ci ha mostrato la notifica, mentre  nel caso io aggiunga una notifica nell xml e rendendo quindi newslist =6 
sarà rivisualizzabile la campanella che ci notificherà la presenza di un nuovo messaggio.


 */

// variabile di controllo al primo avvio sarà sempre null.
int? isup;

class MyNotificationSistem extends StatefulWidget {
  @override
  _MyNotificationSistemState createState() => _MyNotificationSistemState();
}

class _MyNotificationSistemState extends State<MyNotificationSistem> {
  //qui carico il valore salvato nelle shared (I dati collocati nelle SharedPreferences vengono salvati in un file XML contenuto nello storage interno, precisamente nella cartella shared_prefs)
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
            /* print('newslist');
            print(newslist);
            print('isup');
            print(isup); */
            //qui esploro tutti i casi in qui il sistema sicuramente si rompe

            if (isup == null) {
              //se isup è null (primo avvio)
              isup = newslist;
            } else if (isup!.clamp(1, newslist) == isup) {
              //quest if serve se un utente non entrando da giorni perde parecchie notifiche e quindi isup < newslist
              isup = newslist;
            } else if (isup! > newslist + 1) {
              //questa forse è la parte più complicata
              /*
              poniamo il caso caso che io perda i dati nell xml , quest if controlla che isup sia maggiore di newslist + 1 .
              il +1 ci serve per creare una situazione di parità ......

              se abbiamo newslist =5
              e isup =6
              non sarà mai isup > newslist + 1  , perchè risulterà      6 > 6
               */
              isup = newslist;
            }

            if (isup == newslist) {
              return FloatingActionButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100)),side: BorderSide(color: Colors.teal, width: 2.0)),
                  backgroundColor: Theme.of(context).primaryColor.withRed(30),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    _savedList(news);
                    setState(() {
                      isup = 0;
                   
                      wut(context, news);
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

wut(context, news) {
  showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.teal,
              ),
            ),
            child: SizedBox.expand(
                child: Material(
              color: Colors.transparent,
              child: Column(children: [
                Expanded(
                  child: Container(
                      child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        ' Hey ci sono novità!',
                        style: TextStyle(color: Colors.amber, fontSize: 20),
                      ),
                    ),
                  )),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AutoSizeText(news.note.first,
                              style: TextStyle(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 20)),
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.cancel_outlined,
                          color: Colors.amber,
                        )),
                  ),
                )
              ]),
            )),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      });
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
