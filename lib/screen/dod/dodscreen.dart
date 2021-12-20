import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progdrinks/models/drinksofday.dart';
import 'package:progdrinks/services/xmldod.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/mybodystyle.dart';

class DodScreen extends StatefulWidget {
  @override
  _DodScreenState createState() => _DodScreenState();
}
//TODO: finire di integrare i dati dal model e creare la grafica

class _DodScreenState extends State<DodScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: XmlFetchService.fetchDrinkdayXml(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            DayDrinks daydrink = snapshot.data;
            return _scaffold(daydrink);
          } else {
            return _loadingCircle();
          }
        });
  }

  _scaffold(daydrink) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: MyAllPagesAppBar(),
        body: _bodySection(daydrink));
  }

  _bodySection(daydrink) {
    return MyBodyStyle(
        child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          _firstSectionBody(daydrink),
          _title(daydrink),
          _spacer(),
          _ingredientsTitle(),
          _spacer(),
          _ingredientsList(daydrink),
          _spacer(),
          _stepsTitle(),
          _spacer(),
          _stepsList(daydrink)
        ],
      ),
    ));
  }

  _firstSectionBody(daydrink) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.35,
        color: Colors.transparent,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _img(daydrink),
            Align(
              alignment: Alignment.bottomLeft,
              child: _difficulty(daydrink),
            )
          ],
        ));
  }

  _img(daydrink) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: CachedNetworkImage(
        imageUrl: daydrink.img,
        fit: BoxFit.fitHeight,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.37,
      ),
    );
  }

  _title(daydrink) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        daydrink.titolo,
        style: TextStyle(fontSize: 30, color: Colors.grey),
      ),
    );
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
              color: Colors.amber,
            ),
            Text(
              ' : ',
              style: TextStyle(color: Colors.amber),
            ),
            Container(
              width: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: daydrink.difficolta,
                  itemBuilder: (context, index) {
                    return Icon(
                      MdiIcons.asterisk,
                      color: Colors.amber,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  _ingredientsTitle() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Center(
          child: Text(
        'Ingredienti',
        style: TextStyle(fontSize: 20, color: Colors.amber),
      )),
    );
  }

  _ingredientsList(daydrink) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listaingredienti(daydrink),
      ),
    );
  }

  List<Widget> listaingredienti(DayDrinks daydrink) {
    return daydrink.ingredienti.map((ingrediente) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            ingrediente,
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
        ),
      );
    }).toList();
  }

  _stepsTitle() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Center(
          child: Text(
        'Procedimento',
        style: TextStyle(fontSize: 20, color: Colors.amber),
      )),
    );
  }

  _stepsList(daydrink) {
    return Card(
      elevation: 3,
      child: Column(
        children: listastep(daydrink),
      ),
    );
  }

  List<Widget> listastep(DayDrinks daydrink) {
    return daydrink.steps.map((step) {
      return Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(step,
                  style: TextStyle(color: Colors.grey, fontSize: 20)),
            ),
          ));
    }).toList();
  }

  _loadingCircle() {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.amber,
        ),
      ),
    );
  }

  _spacer() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.amberAccent,
        width: MediaQuery.of(context).size.width * 0.8,
        height: 2,
      ),
    );
  }

  _listSpacer() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.grey,
        width: MediaQuery.of(context).size.width * 0.8,
        height: 2,
      ),
    );
  }
}
