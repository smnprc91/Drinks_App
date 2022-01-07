import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/screen/detailsscreen/details.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/mybodystyle.dart';
import 'package:progdrinks/widgets/text.dart';


class Search extends StatefulWidget {
  Search({required this.drinks});

  final List<Drink> drinks;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String drinkcercato = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: MyAllPagesAppBar(
          child: _title(),
        ),
        body: MyBodyStyle(
          child: buildbodystyle(),
        ));
  }

  buildbodystyle() {
    return Container(
        child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.15,
              left: 10,
              right: 10),
          child: Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: TextField(
              onChanged: (risultatoricerca) {
                setState(() {
                  drinkcercato = risultatoricerca.toLowerCase();
                });
              },
              style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontSize: 20),
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blueGrey, width: 2),
                  ),
                  labelText: "Cerca",
                  hintText: 'Inserisci il nome',
                  hintStyle: TextStyle(color: Colors.amber, fontSize: 20),
                  labelStyle: TextStyle(color: Colors.amber, fontSize: 25)),
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: widget.drinks.length,
          itemBuilder: (context, index) {
            return widget.drinks[index].titolo
                    .toLowerCase()
                    .contains(drinkcercato)
                ? GestureDetector(
                  onTap: (){
                     Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dettaglio(
                                        drink: widget.drinks[index],
                                      )));
                  },
                  child: Card(
                    color: Theme.of(context).secondaryHeaderColor,
                      elevation: 19,
                      child: ListTile(
                        leading: CircleAvatar(
                            radius: 25,
                            backgroundImage: CachedNetworkImageProvider(
                                widget.drinks[index].img)),
                        title: Text(widget.drinks[index].titolo),
                        trailing: Icon(Icons.arrow_forward_rounded),
                      ),
                    ),
                )
                : Container();
          },
        ))
      ],
    ));
  }

  _title() {
    return MyText(child: 'Cerca');
  }
}
