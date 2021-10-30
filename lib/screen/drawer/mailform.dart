import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:simple_animations/simple_animations.dart';

class EmailSender extends StatefulWidget {
  const EmailSender({Key? key}) : super(key: key);

  @override
  _EmailSenderState createState() => _EmailSenderState();
}

class _EmailSenderState extends State<EmailSender> {
  bool isHTML = false;

  final _recipientController = TextEditingController(
    text: 'emailtestperapp@gmail.com',
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
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Builder(
        builder: (context) {
          return Container(
            height: 60,
            width: 60,
            decoration: new BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.4),
                borderRadius: new BorderRadius.all(Radius.circular(20))),
            alignment: Alignment.center,
            child: IconButton(
              icon: const Icon(
                Icons.home_filled,
                color: Colors.amber,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
    );
  }

  buildbodystyle() {
    return Container(
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
            child: bodycontent()));
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
                      color: Colors.white,
                      fontSize: 30,
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  controller: _recipientController,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blueGrey, width: 2),
                      ),
                      labelText: 'Destinatario',
                      labelStyle: TextStyle(color: Colors.amber, fontSize: 30)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  controller: _subjectController,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blueGrey, width: 2),
                      ),
                      labelText: 'Il tuo nome e cognome',
                      labelStyle: TextStyle(color: Colors.amber, fontSize: 30)),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 20),
                   controller: _bodyController,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: 2),
                        ),
                       labelText: "Dici cosa ne pensi!",
                   
                      hintStyle:TextStyle(color: Colors.amber, fontSize: 20) ,
                      labelStyle: TextStyle(color: Colors.amber, fontSize: 30)),
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
}
