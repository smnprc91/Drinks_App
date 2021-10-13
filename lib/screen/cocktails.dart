import 'package:flutter/material.dart';
import 'package:progdrinks/Models/drink.dart';
import 'package:simple_animations/simple_animations.dart';

class CockTailsPage extends StatefulWidget {
  const CockTailsPage({required this.drinks});
  final List<Drink> drinks;
  @override
  _CockTailsPageState createState() => _CockTailsPageState();
}

class _CockTailsPageState extends State<CockTailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyStyle(),
    );
  }

  bodyStyle() {
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
            child: list()));
  }

  list() {
    return Container(
        color: Colors.cyan,
        child: SingleChildScrollView(
          child: Column(
              children: buildcard(
            context,
          )),
        ));
  }

  List<Widget> buildcard(
    BuildContext context,
  ) {
    return widget.drinks.map((Drink drink) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              Container(
                child: Image.network(drink.img,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width),
              ),
              Container(
                height: 20,
                color: Colors.brown,
                child: Text(
                  drink.titolo,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Container(
                height: 20,
                color: Colors.brown,
                child: Text(
                  drink.difficolta,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Container(
                child: Column(
                  children: buildTags(context, drink),
                ),
              ),
              Container(
                child: Column(
                  children: buidIngredienti(context, drink),
                ),
              ),
                Container(
                child: Column(
                  children: buidSteps(context, drink),
                ),
              )
            ],
          ),
        ),
      );
    }).toList();
  }

  List<Widget> buildTags(BuildContext context, Drink drink) {
    return drink.tags.map((tag) {
      return Container(
        child : Text(tag)
      );
    }).toList();
  }

List<Widget> buidIngredienti(BuildContext context, Drink drink) {
    return drink.ingredienti.map((ingrediente) {
      return Container(
        child : Text(ingrediente)
      );
    }).toList();
  }
  List<Widget> buidSteps(BuildContext context, Drink drink) {
    return drink.steps.map((step) {
      return Container(
        child : Text(step)
      );
    }).toList();
  }

}
