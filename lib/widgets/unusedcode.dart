/*
  _buildScrollingText() {
    return FutureBuilder(
        future: XmlFetchService.fetchNoteXml(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            News news = snapshot.data;
            return Padding(
              padding:
                  EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 10),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage("assets/legno.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, bottom: 20, left: 10, right: 10),
                    child: Center(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.cyan,
                                  blurRadius: 6.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(
                                    0.0,
                                    3.0,
                                  ),
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Marquee(
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                              text: news.note.first.toUpperCase())),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container(
              color: Colors.transparent,
            );
          }
        });
  } */




  /*
  import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progdrinks/bloc/blocfav.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/models/ingrediente.dart';
import 'package:progdrinks/widgets/FavouriteButton.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/mybodystyle.dart';
import 'package:progdrinks/widgets/mycard.dart';
import 'package:progdrinks/widgets/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? dosi;

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
    bloc.loadSavedData();
    super.initState();
    ini();
    super.initState();
  }

  void ini() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dosi = prefs.getInt('list');
  }

  void ml() async {
    int isup = 1;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('list', isup);
  }

  void parti() async {
    int isup = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('list', isup);
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
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    ml();
                                  });
                                },
                                icon: Icon(Icons.ac_unit)),
                                 IconButton(
                                onPressed: () {
                                  setState(() {
                                   parti();
                                  });
                                },
                                icon: Icon(Icons.ac_unit))
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
      print(widget.drink.ingredienti.length);
      return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: AutoSizeText(
            ingrediente.nome + ingrediente.ingrid + cazz(ingrediente),
            style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor, fontSize: 15),
          ),
        ),
      );
    }).toList();
  }

  cazz(Ingrediente ingrediente) {
    if (dosi != 0) {
      return ingrediente.doseml.toString();
    } else {
      return ingrediente.doseparti;
    }
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
























import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/screen/detailsscreen/details.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/mybodystyle.dart';
import 'package:progdrinks/widgets/text.dart';

class CockTailsPage extends StatefulWidget {
  const CockTailsPage({required this.drinks, required this.categoria});
  final List<Drink> drinks;
  final String categoria;

  @override
  _CockTailsPageState createState() => _CockTailsPageState();
}

class _CockTailsPageState extends State<CockTailsPage> {
  @override
  

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: MyAllPagesAppBar(
        child: _title(widget.categoria),
      ),
      body: bodyStyle(context),
    );
  }

  bodyStyle(context) {
    return MyBodyStyle(child: list(context));
  }

  List<Drink> favdrink = [];
  list(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        child: ListView.builder(
            padding: EdgeInsets.zero,
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: widget.drinks.length,
            itemBuilder: (context, index) {
             widget.drinks.sort((a, b) => a.titolo.compareTo(b.titolo));
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Dettaglio(
                                drink: widget.drinks[index],
                              )));
                },
                child: Card(
                  color: Theme.of(context).primaryColor,
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.transparent,        
                        radius: 25,
                        backgroundImage: CachedNetworkImageProvider(
                            widget.drinks[index].img)),
                    title: Text(
                      widget.drinks[index].titolo,
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                    trailing: Icon(
                      Icons.arrow_right_alt_outlined,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  _title(categoria) {
    return MyText(child: widget.categoria);
  }

 
}











 pippo() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }


 */