//TODO : pulire il codice
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/bloc/blocfav.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/screen/detailsscreen/details.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/mybodystyle.dart';

class CockTailsPage extends StatefulWidget {
  const CockTailsPage({required this.drinks, required this.categoria});
  final List<Drink> drinks;
  final String categoria;
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

  List _selectedItems = [];
  List<Drink> favdrink = [];
  list(context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: widget.drinks.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 19,
              child: ListTile(
                leading: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        CachedNetworkImageProvider(widget.drinks[index].img)),
                title: Text(widget.drinks[index].titolo),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dettaglio(
                                  drink: widget.drinks[index],index: widget.drinks[index],
                                )));
                  },
                  child: Icon(Icons.arrow_forward_rounded),
                ),
              ),
            );
          }),
    );
  }

  _title(categoria) {
    return AutoSizeText(
      widget.categoria,
      style: TextStyle(
          fontSize: 30, color: Colors.amber, fontWeight: FontWeight.bold),
    );
  }
}
