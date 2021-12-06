
//TODO : pulire il codice
import 'package:flutter/material.dart';
import 'package:progdrinks/bloc/blocfav.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/widgets/myappbar.dart';
import 'package:progdrinks/widgets/mybodystyle.dart';

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

  final Bloc bloc = new Bloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(),
      body: bodyStyle(context),
    );
  }

  bodyStyle(context) {
    return MyBodyStyle(child: list(context));
  }

  List _selectedItems = [];
  List<Drink> lezzo = [];
  list(context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: widget.drinks.length,
          itemBuilder: (context, index) {
            return Container(
              child: ListTile(
                  title: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
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
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Image.network(widget.drinks[index].img,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          border: Border(
                            top: BorderSide(
                              color: Colors.blueGrey,
                              width: 1,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Center(
                          child: Text(
                            widget.drinks[index].titolo,
                            style: TextStyle(fontSize: 30, color: Colors.amber),
                          ),
                        ),
                      ),
                      //TODO: Finire di implementare il sistema di selezione favoriti, attualmente fuziona ma bisgona salvare le scelte
                      
                                    
                     GestureDetector(
                        onTap: () {
                          if (_selectedItems.contains(index)) {
                            setState(() {
                              _selectedItems.removeWhere((val) => val == index);
                              lezzo.remove(widget.drinks[index]);
                            });
                          } else {
                            setState(() {
                              _selectedItems.add(index);
                              lezzo.add(widget.drinks[index]);
                              bloc.sinkLezzo.add(lezzo);
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
                                    fontSize: 20, color: Colors.white),
                              ),
                              Icon(
                                  (_selectedItems.contains(index))
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: Colors.amber),
                            ],
                          ),
                        ),
                      ),
                 Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        color: Colors.black.withOpacity(0.3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Difficoltà : ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Text(
                              widget.drinks[index].difficolta,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        color: Colors.black.withOpacity(0.3),
                        child: Center(
                            child: Text(' Caratteristiche :',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.06,
                        color: Colors.black.withOpacity(0.3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: buildTags(context, widget.drinks[index]),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        color: Colors.black.withOpacity(0.3),
                        child: Center(
                            child: Text(
                          'Ingredienti',
                          style: TextStyle(fontSize: 20, color: Colors.amber),
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.blueGrey,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              listaingredienti(context, widget.drinks[index]),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        color: Colors.black.withOpacity(0.3),
                        child: Center(
                            child: Text(
                          'Procedimento',
                          style: TextStyle(fontSize: 20, color: Colors.amber),
                        )),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.blueGrey,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: listastep(context, widget.drinks[index]),
                          ))
                    ],
                  ),
                ),
              )),
            );
          }),
    );
  }

  List<Widget> buildTags(BuildContext context, Drink drink) {
    return drink.tags.map((tag) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child:
                Text(tag, style: TextStyle(fontSize: 18, color: Colors.white))),
      );
    }).toList();
  }

  List<Widget> listaingredienti(BuildContext context, Drink drink) {
    return drink.ingredienti.map((ingrediente) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            ingrediente,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> listastep(BuildContext context, Drink drink) {
    return drink.steps.map((step) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Text(step, style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      );
    }).toList();
  }
}
