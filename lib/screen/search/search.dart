import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/screen/detailsscreen/details.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/mybodystyle.dart';
import 'package:progdrinks/widgets/mycard.dart';
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
                  labelText: "Tocca qui",
                  hintText: 'Inserisci il nome del drink',
                  hintStyle: TextStyle(color: Colors.amber, fontSize: 15),
                  labelStyle: TextStyle(color: Colors.amber, fontSize: 15)),
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
                  child: MyCard(
                   value: 0,
                      child: ListTile(
                        leading: CircleAvatar(
                            radius: 25,
                            backgroundImage: CachedNetworkImageProvider(
                                widget.drinks[index].img)),
                        title: AutoSizeText(widget.drinks[index].titolo,style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 15),),
                        trailing: Icon(Icons.arrow_forward_rounded,color:  Theme.of(context).secondaryHeaderColor,),
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
