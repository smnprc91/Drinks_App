import 'package:auto_animated/auto_animated.dart';
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
    final options = LiveOptions(
      delay: Duration(milliseconds: 100),
      showItemInterval: Duration(milliseconds: 100),
      showItemDuration: Duration(milliseconds: 200),
      visibleFraction: 0.05,
      reAnimateOnVisibility: false,
    );
    widget.drinks.sort((a, b) => a.titolo.compareTo(b.titolo));
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        child: LiveList.options(
          options: options,
          itemBuilder: buildAnimatedItem,
          scrollDirection: Axis.vertical,
          itemCount: widget.drinks.length,
        ),
      ),
    );
  }

  Widget buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    return FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(-0.5, 0),
              end: Offset.zero,
            ).animate(animation),
            // Paste you Widget
            child: GestureDetector(
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
                  leading: Hero(
                    tag: widget.drinks[index].drinkid,
                    child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 25,
                        backgroundImage:
                            CachedNetworkImageProvider(widget.drinks[index].img)),
                  ),
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
            )));
  }

  _title(categoria) {
    return MyText(child: widget.categoria);
  }
}
