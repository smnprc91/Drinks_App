
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
    return Container(
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
                elevation: 19,
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          CachedNetworkImageProvider(widget.drinks[index].img)),
                  title: Text(widget.drinks[index].titolo),
                  trailing: Icon(Icons.arrow_forward_rounded),
                ),
              ),
            );
          }),
    );
  }

  _title(categoria) {
    return MyText(child: widget.categoria);
  }
}
