import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progdrinks/bloc/blocfav.dart';
import 'package:progdrinks/models/drink.dart';
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
        child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          _firstSectionBody(drink),
          _favSelection(drink),
          Card(
            elevation: 9,
            child: Column(
              children: [
                _ingredientsTitle(),
                _spacer(),
                _ingredientsList(drink),
              ],
            ),
          ),
          Card(
            elevation: 9,
            child: Column(
              children: [_stepsTitle(), _spacer(), _stepsList(drink)],
            ),
          ),
        ],
      ),
    ));
  }

  _firstSectionBody(Drink drink) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.40,
        color: Colors.transparent,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _img(drink),
            Align(
              alignment: Alignment.bottomLeft,
              child: _difficulty(drink),
            )
          ],
        ));
  }

  _img(Drink drink) {
    return ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.transparent],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: CachedNetworkImage(
            imageUrl: widget.drink.img,
            fit: BoxFit.fitHeight,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.37,
          ),
        ));
  }

  _title(Drink drink) {
    return MyText(child: drink.titolo);
  }

  _difficulty(Drink drink) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Difficoltà :'),
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
                  itemCount: drink.difficolta,
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

  _ingredientsList(Drink drink) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listaingredienti(drink),
    );
  }

  List<Widget> listaingredienti(Drink drink) {
    return widget.drink.ingredienti.map((ingrediente) {
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

  _stepsList(drink) {
    return Column(
      children: listastep(drink),
    );
  }

  List<Widget> listastep(drink) {
    return widget.drink.steps.map((step) {
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

  _favSelection(Drink drink) {
    return FavouriteButton(drinkid: drink.drinkid);
  }

/**
 *   _listSpacer() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.grey,
        width: MediaQuery.of(context).size.width * 0.8,
        height: 2,
      ),
    );
  }
 */

  /*   GestureDetector(
                        onTap: () {
                          if (_selectedItems.contains(index)) {
                            setState(() {
                              _selectedItems.removeWhere((val) => val == index);
                              favdrink.remove(widget.drinks[index]);
                            });
                          } else {
                            setState(() {
                              _selectedItems.add(index);
                              favdrink.add(widget.drinks[index]);
                              bloc.sinkFavdrink.add(favdrink);
                            });
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.05,
                          color: Colors.black.withOpacity(0.3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Aggiungi ai preferiti',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey),
                              ),
                              Icon(
                                  (_selectedItems.contains(index))
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: Colors.amber),
                            ],
                          ),
                        ),
                      ), */
}
