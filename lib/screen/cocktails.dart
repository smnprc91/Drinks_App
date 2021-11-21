import 'package:flutter/material.dart';
import 'package:progdrinks/Models/drink.dart';
import 'package:progdrinks/raccoltaWidget/MyAppBar.dart';
import 'package:progdrinks/raccoltaWidget/MyBodyStyle.dart';
import 'package:progdrinks/screen/dettaglio.dart';

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
      appBar: MyAppBar(),
      body: bodyStyle(context),
    );
  }

  bodyStyle(context) {
    return MyBodyStyle(child: list(context));
  }

  list(context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: widget.drinks.length,
          itemBuilder: (context, index) {
            return lista(index);
          }),
    );
  }

  lista(index) {
    return GestureDetector(
      onTap: () {
        print(index);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Dettaglio(
                      drink: widget.drinks[index],
                      index: widget.drinks[index].toString(),
                    )));
      },
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
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
                height: MediaQuery.of(context).size.height * 0.05,
                child: Center(
                  child: Text(
                    widget.drinks[index].titolo,
                    style: TextStyle(fontSize: 30, color: Colors.amber),
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
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      widget.drinks[index].difficolta,
                      style: TextStyle(fontSize: 18, color: Colors.white),
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
                        style: TextStyle(fontSize: 20, color: Colors.white))),
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
            ],
          ),
        ),
      ),
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
}
