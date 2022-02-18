import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/screen/dod/dodscreen.dart';

class DrinkOfDaySection extends StatefulWidget {
  const DrinkOfDaySection({Key? key}) : super(key: key);

  @override
  _DrinkOfDaySectionState createState() => _DrinkOfDaySectionState();
}

class _DrinkOfDaySectionState extends State<DrinkOfDaySection> {
  @override
  Widget build(BuildContext context) {
    return _firstSectionBody();
  }

  _firstSectionBody() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => DodScreen()),
        );
      },
      child: Container(
        
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.42,
        color: Colors.transparent,
        child: Stack(
          
          children: [
            _img(),
            _positioned(),
          ],
        ),
      ),
    );
  }

  _img() {

    
    return Center(
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width*0.9,
       
        child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child:  Image.asset(
          'assets/dod.jpg',)
      ),
      ),
    );
  }

  _positioned() {
    return Positioned(
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
        bottom: 0,
        child: _containerDeco());
  }

  _containerDeco() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: _firstBoxDecoration(),
        child: _row());
  }

  _firstBoxDecoration() {
    return BoxDecoration(
        boxShadow: [_firstBoxShadow()],
        color: Theme.of(context).primaryColor.withRed(30),
        borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0)));
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
      size: 25,
    );
  }

  _autoSized() {
    return AutoSizeText('Drink del giorno',
        maxLines: 1,
        minFontSize: 20,
        style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor, fontSize: 15));
  }
}
