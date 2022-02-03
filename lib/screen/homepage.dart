import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/bloc/blocfav.dart';
import 'package:progdrinks/models/categoria.dart';
import 'package:progdrinks/models/news.dart';
import 'package:progdrinks/screen/carousel/carouselsection.dart';
import 'package:progdrinks/screen/dod/dodsection.dart';
import 'package:progdrinks/screen/drawer/drawer.dart';
import 'package:progdrinks/screen/search/search.dart';
import 'package:progdrinks/services/xml.dart';
import 'package:progdrinks/widgets/mybodystyle.dart';
import 'package:progdrinks/widgets/mycircular.dart';
import 'package:progdrinks/widgets/realtimenotification.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Bloc bloc = Bloc();

  @override
  Widget build(BuildContext context) {
    return _futureBuilder();
  }

  _futureBuilder() {
    return FutureBuilder(
      future: XmlFetchService.fetchCatXml(),
      builder: ((BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Categoria> categorie = snapshot.data as List<Categoria>;

          List<Drink> drinks = categorie
              .map((Categoria c) => c.drinks)
              .expand((e) => e)
              .toList();

          bloc.drinks = drinks;

          return _scaffold(drinks, categorie);
        } else {
          return MyCircularProgressIndicator();
        }
      }),
    );
  }

  _scaffold(drinks, categorie) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(drinks),
      drawer: Drawers(),
      body: bodyMainContent(categorie, drinks),
      floatingActionButton: MyNotificationSistem(),
    );
  }

  _appBar(drinks) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.amber),
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

  bodyMainContent(List<Categoria> categorie, drinks) {
    return MyBodyStyle(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrinkOfDaySection(),
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
