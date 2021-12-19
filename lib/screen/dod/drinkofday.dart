import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/screen/dod/dodscreen.dart';

class DrinkOfDay extends StatefulWidget {
  const DrinkOfDay({Key? key}) : super(key: key);

  @override
  _DrinkOfDayState createState() => _DrinkOfDayState();
}

class _DrinkOfDayState extends State<DrinkOfDay> {
  @override
  Widget build(BuildContext context) {
    return _firstSectionBody();
  }

  _firstSectionBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.42,
      color: Colors.transparent,
      child: Stack(
        textDirection: TextDirection.rtl,
        children: [
          _imgGesture(),
          _positioned(),
        ],
      ),
    );
  }

  _imgGesture() {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => DodScreen()),
          );
        },
        child: _img());
  }

  _img() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: CachedNetworkImage(
        imageUrl: 'https://www.labarbieriadimilano.it/images/18_immagine.jpg',
        fit: BoxFit.fitHeight,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.37,
      ),
    );
  }

  _positioned() {
    return Positioned(
        left: MediaQuery.of(context).size.width * 0.1,
        right: 0,
        bottom: 0,
        child: _containerDeco());
  }

  _containerDeco() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.11,
        decoration: _firstBoxDecoration(),
        child: _row());
  }

  _firstBoxDecoration() {
    return BoxDecoration(
        boxShadow: [_firstBoxShadow()],
        color: Colors.white,
        borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(40.0), bottomLeft: Radius.circular(40.0)));
  }

  _firstBoxShadow() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3), // changes position of shadow
    );
  }

  _row() {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_icon(), _autoSized()],
    ));
  }

  _icon() {
    return Icon(
      Icons.thumb_up_off_alt,
      color: Colors.amber,
      size: 30,
    );
  }

  _autoSized() {
    return AutoSizeText('Drink del giorno',
        maxLines: 1,
        minFontSize: 20,
        style: TextStyle(color: Colors.black45, fontSize: 30));
  }
}
