import 'package:flutter/material.dart';
import 'package:progdrinks/Models/drink.dart';
import 'package:progdrinks/bloc/block.dart';
import 'package:simple_animations/simple_animations.dart';

class Details extends StatefulWidget {
  const Details({required this.drink, required this.index});
  final List<Drink> drink;
  final String index;
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Bloc().streamDrinkSelezionato,
        builder: (context, AsyncSnapshot<Drink> risultatoStream) {
          if (risultatoStream.hasData) {






              var vazzoTags =
                risultatoStream.data!.tags.map((tag) {
              return Container(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(tag,style: TextStyle(color: Colors.white ,fontSize: 50)),
              ),);
            }).toList();


             var vazzoIngredienti =
                risultatoStream.data!.ingredienti.map((ingrediente) {
              return Container(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(ingrediente,style: TextStyle(color: Colors.white ,fontSize: 50),),
              ),);
            }).toList();



               var vazzoSteps =
                risultatoStream.data!.steps.map((step) {
              return Container(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(step,style: TextStyle(color: Colors.white ,fontSize: 50)),
              ),);
            }).toList();















      
            return Scaffold(
                body: Container(
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.036),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Colors.blueGrey,
                                    width: 1,
                                  ),
                                ),
                                child: Hero(
                                    tag: widget.index.toString(),
                                    child: Image.network(
                                        risultatoStream.data!.img)),
                              ),
                            ),
                            Text(
                              risultatoStream.data!.titolo,
                              style: TextStyle(color: Colors.white),
                            ),
                               Text(
                              risultatoStream.data!.difficolta,
                              style: TextStyle(color: Colors.white),
                            ),
                                Row(children: vazzoTags,),
                              Row(children: vazzoIngredienti,),
                               Row(children: vazzoSteps,)

                          ],
                        ),
                      ),
                    )));
          } else {
            return Container();
          }
        });
  }
    
 
}
/** */