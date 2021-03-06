import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/mybodystyle.dart';
import 'package:progdrinks/widgets/text.dart';

class EmailSender extends StatefulWidget {
  const EmailSender({Key? key}) : super(key: key);

  @override
  _EmailSenderState createState() => _EmailSenderState();
}

class _EmailSenderState extends State<EmailSender> {
  bool isHTML = false;

  final _recipientController = TextEditingController(
    text: 'drinkit@sidajo.xyz',
  );

  final _subjectController = TextEditingController(text: ' ');

  final _bodyController = TextEditingController(
    text: '  ',
  );

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'Mail inviata. Grazie per il tuo supporto';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildAppBar(),
        body: buildbodystyle());
  }

  buildAppBar() {
    return MyAllPagesAppBar(
      child: _title(),
    );
  }

  buildbodystyle() {
    return MyBodyStyle(child: bodycontent());
  }

  bodycontent() {
    return ListView(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 10, right: 10, bottom: 30),
                child: Text(
                    'Inviaci il tuo feedback o una tua ricetta compilando questo form',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 20,
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 15),
                  controller: _recipientController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 2),
                      ),
                      labelText: 'Destinatario',
                      labelStyle: TextStyle(color: Colors.amber, fontSize: 20)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 20),
                  controller: _subjectController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 2),
                      ),
                      labelText: 'Il tuo nome e cognome',
                      labelStyle: TextStyle(color: Colors.amber, fontSize: 20)),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontSize: 20),
                    controller: _bodyController,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).secondaryHeaderColor,
                              width: 2),
                        ),
                        labelText: "Di cosa ne pensi!",
                        hintStyle: TextStyle(color: Colors.amber, fontSize: 20),
                        labelStyle:
                            TextStyle(color: Colors.amber, fontSize: 20)),
                  ),
                ),
              ),
              Center(
                  child: IconButton(
                onPressed: send,
                icon: Icon(Icons.send, color: Colors.amber, size: 40),
              ))
            ],
          ),
        ),
      ],
    );
  }

  _title() {
    return MyText(child: 'Contatti');
  }
}
