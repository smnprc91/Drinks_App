import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/models/categoria.dart';
import 'package:progdrinks/screen/cocktails/cocktails.dart';
import 'package:progdrinks/screen/dod/dodscreen.dart';
import 'package:progdrinks/screen/drawer/drawer.dart';
import 'package:progdrinks/screen/search/search.dart';
import 'package:progdrinks/services/xml.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentImage = 0;
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = <TargetFocus>[];

  GlobalKey keyButton = GlobalKey();
  GlobalKey keyButton1 = GlobalKey();
  GlobalKey keyButton2 = GlobalKey();

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

          var drinks = categorie
              .map((Categoria c) => c.drinks)
              .toList()
              .expand((e) => e)
              .toList();

          return _scaffold(drinks, categorie);
        } else {
          return _loadingCircle();
        }
      }),
    );
  }

  _scaffold(drinks, categorie) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: _floatingActionButton(),
      appBar: _appBar(drinks),
      drawer: Drawers(),
      body: bodyMainContent(categorie, drinks),
    );
  }

  _floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      child: Container(
        key: keyButton2,
        child: Icon(
          Icons.priority_high,
          color: Colors.amber,
          key: keyButton1,
        ),
      ),
      onPressed: () {
        showTutorial();
      },
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
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _firstSectionBody(),
          _secondSectionBody(categorie),
        ],
      ),
    );
  }

  _firstSectionBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.42,
      color: Colors.transparent,
      child: Stack(
        children: [
          _imgGesture(),
          _positioned(),
        ],
      ),
    );
  }

  _imgGesture() {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => DodScreen()),
          );
        },
        child: _img());
  }

  _img() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: CachedNetworkImage(
        imageUrl: 'https://www.labarbieriadimilano.it/images/18_immagine.jpg',
        fit: BoxFit.fitHeight,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.37,
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
        height: MediaQuery.of(context).size.height * 0.11,
        decoration: _firstBoxDecoration(),
        child: _row());
  }

  _firstBoxDecoration() {
    return BoxDecoration(
        boxShadow: [_firstBoxShadow()],
        color: Colors.white,
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
      size: 30,
    );
  }

  _autoSized() {
    return AutoSizeText('Drink del giorno',
        maxLines: 1,
        minFontSize: 20,
        style: TextStyle(color: Colors.black45, fontSize: 30));
  }

  _secondSectionBody(List<Categoria> categorie) {
    return Container(
        color: Colors.transparent,
        child: Column(
          children: [
            _firstColumnSection(),
            _secondColumnSection(categorie),
            _thirdColumnSection(categorie),
            _fourthColumnSection(),
          ],
        ));
  }

  _firstColumnSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        color: Colors.amberAccent,
        width: MediaQuery.of(context).size.width * 0.8,
        height: 2,
      ),
    );
  }

  _secondColumnSection(categorie) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Categoria: ' +
              _caText(
                categorie,
              ),
          style: TextStyle(color: _colText(), fontSize: 25),
        ),
      ),
    );
  }

  _caText(
    List<Categoria> categorie,
  ) {
    if (currentImage == 0) {
      return categorie[0].titolo;
    } else if (currentImage == 1) {
      return categorie[1].titolo;
    } else {
      return categorie[2].titolo;
    }
  }

  _colText() {
    if (currentImage == 0) {
      return Colors.black45;
    } else if (currentImage == 1) {
      return Colors.black45;
    } else {
      return Colors.black45;
    }
  }

  _thirdColumnSection(categorie) {
    return CarouselSlider.builder(
        itemCount: categorie.length,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          onPageChanged: (index, fn) {
            setState(() {
              currentImage = index;
            });
          },
        ),
        itemBuilder: (
          BuildContext context,
          int index,
          int i,
        ) {
          return Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                     GestureDetector(
                       onTap: (){
                            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CockTailsPage(
                              drinks: categorie[index].drinks,categoria:  categorie[index].titolo,
                            )));
                       },
                       child: CachedNetworkImage( fit: BoxFit.cover, width: 1000.0, imageUrl:categorie[index].img ,)),
                      
                    ],
                  )),
            ),
          );
        });
  }

  _fourthColumnSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        color: Colors.amberAccent,
        width: MediaQuery.of(context).size.width * 0.8,
        height: 2,
      ),
    );
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

  void showTutorial() {
    initTargets();
    tutorialCoachMark = TutorialCoachMark(
      context,
      targets: targets,
      colorShadow: Colors.white.withOpacity(0.5),
      textStyleSkip: TextStyle(color: Colors.black),
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.8,
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
      onSkip: () {
        print("skip");
      },
    )..show();
  }

  void initTargets() {
    targets.clear();
    _firstPage();
    _secondPage();
  }

  _firstPage() {
    return targets.add(
      TargetFocus(
        identify: "keyBottomNavigation1",
        keyTarget: keyButton1,
        alignSkip: Alignment.topRight,
        contents: [_firstTargetContent()],
      ),
    );
  }

  _firstTargetContent() {
    return TargetContent(
      align: ContentAlign.top,
      builder: (context, controller) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AutoSizeText(
                "ciao ",
                minFontSize: 30,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _secondPage() {
    return targets.add(
      TargetFocus(
        identify: "keyBottomNavigation2",
        keyTarget: keyButton2,
        alignSkip: Alignment.topRight,
        contents: [_secondTargetContent()],
      ),
    );
  }

  _secondTargetContent() {
    return TargetContent(
      align: ContentAlign.top,
      builder: (context, controller) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AutoSizeText(
                "yo yo yo ",
                minFontSize: 30,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
