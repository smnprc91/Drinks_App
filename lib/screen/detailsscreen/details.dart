import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progdrinks/bloc/blocfav.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/widgets/FavouriteButton.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/mybodystyle.dart';
import 'package:progdrinks/widgets/mycard.dart';
import 'package:progdrinks/widgets/text.dart';

class Dettaglio extends StatefulWidget {
  const Dettaglio({
    required this.drink,
  });

  final Drink drink;

  @override
  _DettaglioState createState() => _DettaglioState();
}

class _DettaglioState extends State<Dettaglio> {
  @override
  void initState() {
    Bloc bloc = Bloc();
    bloc.loadSavedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold(widget.drink);
  }

  List<Drink> favdrink = [];
  _scaffold(drink) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: MyAllPagesAppBar(child: _title(drink)),
        body: _bodySection(drink));
  }

  _bodySection(drink) {
    return MyBodyStyle(
        child: Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            _firstSectionBody(drink),
            Card(
              elevation: 1,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 5),
                      child: _difficulty(drink),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                      child: MyCard(
                        value: 8.0,
                        child: Column(
                          children: [
                            _ingredientsTitle(),
                            _buildIngredientsList(drink),
                          ],
                        ),
                      ),
                    ),
                    MyCard(
                      value: 8.0,
                      child: Column(
                        children: [
                          _stepsTitle(),
                          _stepsList(drink),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  _firstSectionBody(daydrink) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.40,
        child: Stack(
          children: [
            _img(daydrink),
            Positioned(
              child: FavouriteButton(
                  color: Theme.of(context).primaryColor,
                  drinkid: widget.drink.drinkid,
                  titolo: widget.drink.titolo),
              top: MediaQuery.of(context).size.height * 0.3,
              left: MediaQuery.of(context).size.width * 0.7,
            )
          ],
        ));
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

  _ingredientsTitle() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AutoSizeText('Ingredienti :',
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).secondaryHeaderColor,
              fontWeight: FontWeight.w700,
            )),
      ),
    );
  }

  _buildIngredientsList(daydrink) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ingredientList(daydrink),
    );
  }

  List<Widget> ingredientList(Drink drink) {
    return widget.drink.ingredienti.map((ingrediente) {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: AutoSizeText(
            ingrediente,
            style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor, fontSize: 15),
          ),
        ),
      );
    }).toList();
  }

  _stepsTitle() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AutoSizeText(
          'Procedimento :',
          style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).secondaryHeaderColor,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  _stepsList(daydrink) {
    return Column(
      children: listastep(daydrink),
    );
  }

  List<Widget> listastep(Drink drink) {
    return widget.drink.steps.map((step) {
      return Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 4),
            child: AutoSizeText(step,
                style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 15)),
          ));
    }).toList();
  }
}
