import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progdrinks/bloc/blocfav.dart';
import 'package:progdrinks/bloc/blocingr.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/screen/detailsscreen/ingredientssection.dart';
import 'package:progdrinks/screen/detailsscreen/stepsection.dart';
import 'package:progdrinks/widgets/FavouriteButton.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/mybodystyle.dart';
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
  void initState() {
    Bloc bloc = Bloc();
    BlocCart blocCart = BlocCart();
    bloc.loadSavedData();
    blocCart.loadSavedDataCart();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold(widget.drink, context);
  }

  List<Drink> favdrink = [];
  _scaffold(drink, context) {
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
                    IngredientSection(drink: drink),
                    StepsSection(drink: drink)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  _firstSectionBody(drink) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.40,
        child: Stack(
          children: [
            _img(drink),
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

  _img(drink) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: CachedNetworkImage(
        imageUrl: drink.img,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.37,
      ),
    );
  }

  _title(drink) {
    return MyText(child: drink.titolo);
  }

  _difficulty(drink) {
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
                  itemCount: drink.difficolta,
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
