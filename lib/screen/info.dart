import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/mybodystyle.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAllPagesAppBar(
        child: Text(''),
      ),
      body: MyBodyStyle(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 80,
                backgroundImage: AssetImage('assets/drinkit.png')),
            Padding(
              padding: const EdgeInsets.only(top:25.0),
              child: Container(
                width: MediaQuery.of(context).size.width*0.7,
                child: AutoSizeText(
                  'Per i contributi video si ringrazia il team di',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  minFontSize: 18,
                  style: TextStyle(color: Colors.amber),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText('Italian Bartenders',
                  textAlign: TextAlign.justify,
                  maxLines: 2,
                  minFontSize: 25,
                  style: TextStyle(color: Colors.teal)),
            ),
            Padding(
              padding: const EdgeInsets.only(top:25.0),
              child: Container(
                 width: MediaQuery.of(context).size.width*0.7,
                child: AutoSizeText('Per le immagini si ringrazia lo staff di  ',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    minFontSize: 18,
                    style: TextStyle(color: Colors.amber)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText('TheCocktailDB',
              
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.teal),minFontSize: 25,),
            ),
            Padding(
              padding: const EdgeInsets.only(top:25.0),
              child: Container(
                 width: MediaQuery.of(context).size.width*0.7,
                child: AutoSizeText(
                  'Senza il loro supporto tutto questo non sarebbe possibile',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  minFontSize: 18,
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
