import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progdrinks/models/drinksofday.dart';
import 'package:progdrinks/screen/dod/dodingrsection.dart';
import 'package:progdrinks/screen/dod/dodstepssection.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/mybodystyle.dart';
import 'package:progdrinks/widgets/text.dart';

class DodScreen extends StatefulWidget {
  DodScreen({required this.daydrink});
  final DayDrinks daydrink;
  @override
  _DodScreenState createState() => _DodScreenState();
}

class _DodScreenState extends State<DodScreen> {
  @override
  Widget build(BuildContext context) {
    return _scaffold(widget.daydrink);
  }

  _scaffold(daydrink) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: MyAllPagesAppBar(child: _title(daydrink)),
        body: _bodySection(daydrink));
  }

  _bodySection(daydrink) {
    return Hero(
      tag: '1',
      child: MyBodyStyle(
          child: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              _firstSectionBody(daydrink),
              Card(
                elevation: 1,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: _difficulty(daydrink),
                      ),
                      DodIngredientsSection(daydrink: daydrink),
                      DodStepsSection(daydrink: daydrink)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  _firstSectionBody(daydrink) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.40,
        child: _img(daydrink));
  }

  _img(daydrink) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: CachedNetworkImage(
        imageUrl: daydrink.img,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.37,
      ),
    );
  }

  _title(daydrink) {
    return MyText(child: daydrink.titolo);
  }

  _difficulty(daydrink) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              MdiIcons.chefHat,
              color: Theme.of(context).secondaryHeaderColor,
              size: 15,
            ),
            AutoSizeText(
              '  Difficoltà  ',
              style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
            ),
            Text(
              '  :  ',
              style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
            ),
            Container(
              width: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: daydrink.difficolta,
                  itemBuilder: (context, index) {
                    return Icon(
                      MdiIcons.asterisk,
                      color: Theme.of(context).secondaryHeaderColor,
                      size: 15,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }


}
