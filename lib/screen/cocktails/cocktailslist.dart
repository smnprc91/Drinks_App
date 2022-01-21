
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
      padding: const EdgeInsets.only(top:30.0),
      child: Container(
        child: ListView.builder(
            padding: EdgeInsets.zero,
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: widget.drinks.length,
            itemBuilder: (context, index) {
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
                  color:  Theme.of(context).primaryColor,
                  elevation: 10,
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            CachedNetworkImageProvider(widget.drinks[index].img)),
                    title: Text(widget.drinks[index].titolo,style: TextStyle(color: Theme.of(context).secondaryHeaderColor ),),
                    trailing:   CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor.withRed(50),
                      child: Icon(Icons.arrow_right_alt_outlined),)),
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
