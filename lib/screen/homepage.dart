
import 'package:flutter/material.dart';
import 'package:progdrinks/bloc/blocfav.dart';
import 'package:progdrinks/bloc/blocingr.dart';
import 'package:progdrinks/models/categoria.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/models/drinksofday.dart';
import 'package:progdrinks/models/ingrediente.dart';
import 'package:progdrinks/screen/carousel/carouselsection.dart';
import 'package:progdrinks/screen/dod/dodhome.dart';
import 'package:progdrinks/screen/drawer/drawer.dart';
import 'package:progdrinks/screen/search/search.dart';
import 'package:progdrinks/services/xml.dart';
import 'package:progdrinks/widgets/mybodystyle.dart';
import 'package:progdrinks/widgets/mycircular.dart';
import 'package:progdrinks/widgets/realtimenotification.dart';
import 'package:progdrinks/widgets/text.dart';

import '../services/xmldod.dart';

class HomePage extends StatefulWidget {
 
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Bloc bloc = Bloc();
  BlocCart blocingr = BlocCart();
  @override
  Widget build(BuildContext context) {
    return _futureBuilder();
  }

  _futureBuilder() {
    return FutureBuilder(
       
      future:  Future.wait([XmlFetchService.fetchCatXml(),XmlFetchServiceDod.fetchDrinkdayXml()]),
      builder: ((BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          List<Categoria> categorie = snapshot.data![0];
         DayDrinks daydrink = snapshot.data![1];
          List<Drink> drinks = categorie
              .map((Categoria c) => c.drinks)
              .expand((e) => e)
              .toList();

          List<Ingrediente> ingredienti = drinks
              .map((e) => e.ingredienti)
              .expand((element) => element)
              .toList();

          bloc.drinks = drinks;
          blocingr.ingredienti = ingredienti;
          return _scaffold(drinks, categorie,daydrink);
        } else {
          return MyCircularProgressIndicator();
        }
      }),
    );
  }

  _scaffold(drinks, categorie, dayDrink) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      extendBodyBehindAppBar: false,
      appBar: _appBar(drinks),
      drawer: Drawers(),
      body: bodyMainContent(
        categorie,dayDrink
      ),
      floatingActionButton: MyNotificationSistem(),
    );
  }

  _appBar(drinks) {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.amber),
      centerTitle: true,
      title: MyText(child: 'Drink It'),
      actions: [
        _searchButton(drinks),
      ],
    );
  }

  _searchButton(drinks) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Search(drinks: drinks)));
        },
        child: Icon(
          Icons.search_sharp,
          size: 30,
          color: Colors.amber,
        ),
      ),
    );
  }

  bodyMainContent(
    List<Categoria> categorie,daydrink
  ) {
    return MyBodyStyle(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
        DodHome(
            daydrink: daydrink,
          ), 
          CarouselSection(
            categorie: categorie,
          ),
        ],
      ),
    );
  }

}
