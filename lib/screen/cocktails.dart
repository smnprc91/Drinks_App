import 'package:flutter/material.dart';
import 'package:progdrinks/Models/drink.dart';

import 'package:progdrinks/screen/details.dart';
import 'package:simple_animations/simple_animations.dart';

class CockTailsPage extends StatefulWidget {
  const CockTailsPage({required this.drinks});
  final List<Drink> drinks;
  @override
  _CockTailsPageState createState() => _CockTailsPageState();
}

class _CockTailsPageState extends State<CockTailsPage> {
  Size displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    return displaySize(context).width;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: bodyStyle(context),
    );
  }

  bodyStyle(context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xff000029),
          backgroundBlendMode: BlendMode.srcOver,
        ),
        child: PlasmaRenderer(
            type: PlasmaType.infinity,
            particles: 10,
            color: Color(0x44e45a23),
            blur: 0.2,
            size: 0.30,
            speed: 2,
            offset: 0,
            blendMode: BlendMode.plus,
            particleType: ParticleType.atlas,
            variation1: 0,
            variation2: 0,
            variation3: 0,
            rotation: 0,
            child: list(context)));
  }

  list(context) {
    return Container(
        child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10),
        child: Column(
          children: buildcard(
            context,
          ),
        ),
      ),
    ));
  }

  List<Widget> buildcard(
    BuildContext context,
  ) {
    return widget.drinks.map((Drink drink) {
      var index = widget.drinks.indexOf(drink).toString();
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(
                        drink: widget.drinks,
                        index: index,
                      )));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.blueGrey,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Hero(
                  tag: index,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Image.network(drink.img,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width),
                  ),
                ),
                Container(
                   decoration: BoxDecoration(
                 color: Colors.black.withOpacity(0.3),
                border: Border(top: 
                  BorderSide(color: Colors.blueGrey,
                  width: 1,
                ),),
            ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
               
                  child: Center(
                    child: Text(
                      drink.titolo,
                      style: TextStyle(fontSize: 30, color: Colors.amber),
                    ),
                  ),
                ),
                Container(
                  
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: Colors.black.withOpacity(0.3),
                  child: Center(
                    child: Text(
                      drink.difficolta,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: Colors.black.withOpacity(0.3),
                  child: Row(
                    children: buildTags(context, drink),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> buildTags(BuildContext context, Drink drink) {
    return drink.tags.map((tag) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child:
                Text(tag, style: TextStyle(fontSize: 20, color: Colors.white))),
      );
    }).toList();
  }
}
