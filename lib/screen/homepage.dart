import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/bloc/blocingr.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/bloc/blocfav.dart';
import 'package:progdrinks/models/categoria.dart';
import 'package:progdrinks/models/drinksofday.dart';
import 'package:progdrinks/models/ingrediente.dart';
import 'package:progdrinks/models/news.dart';
import 'package:progdrinks/screen/carousel/carouselsection.dart';
import 'package:progdrinks/screen/dod/dodhome.dart';
import 'package:progdrinks/screen/drawer/drawer.dart';
import 'package:progdrinks/screen/search/search.dart';
import 'package:progdrinks/services/xml.dart';
import 'package:progdrinks/widgets/mybodystyle.dart';
import 'package:progdrinks/widgets/mycircular.dart';
import 'package:progdrinks/widgets/realtimenotification.dart';
import 'package:progdrinks/widgets/text.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.daydrink});
  final DayDrinks daydrink;
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
         // per  chiamare molti fetch     future: Future.wait([XmlFetchService.fetchCatXml(),XmlFetchService.fetchNoteXml()]),
      future: XmlFetchService.fetchCatXml(),
      builder: ((BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Categoria> categorie = snapshot.data as List<Categoria>;

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
          return _scaffold(drinks, categorie);
        } else {
          return MyCircularProgressIndicator();
        }
      }),
    );
  }

  _scaffold(drinks, categorie) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      extendBodyBehindAppBar: false,
      appBar: _appBar(drinks),
      drawer: Drawers(),
      body: bodyMainContent(
        categorie,
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
    List<Categoria> categorie,
  ) {
    return MyBodyStyle(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DodHome(
            daydrink: widget.daydrink,
          ),
          CarouselSection(
            categorie: categorie,
          ),
        ],
      ),
    );
  }

  List<Widget> buildnote(News news) {
    return news.note.map((note) {
      return Card(
          color: Theme.of(context).secondaryHeaderColor,
          elevation: 9,
          child: ListTile(
            title: AutoSizeText(
              note,
              style: TextStyle(
                  fontSize: 15, color: Theme.of(context).primaryColor),
            ),
          ));
    }).toList();
  }
}
