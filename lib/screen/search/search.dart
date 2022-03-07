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
  bool control = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
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
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            label: Text(
              'Filtri',
              style: TextStyle(color: Colors.amber),
            ),
            icon: Icon(
              Icons.filter_list,
              color: Colors.amber,
              size: 15,
            ),
            onPressed: () {
              _showAlertDialog(context);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextField(
              onChanged: (risultatoricerca) {
                setState(() {
                  drinkcercato = risultatoricerca.toLowerCase();
                });
              },
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor, fontSize: 20),
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blueGrey, width: 2),
                  ),
                  labelText: "Scrivi qui",
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
                  widget.drinks.sort((a, b) => a.titolo.compareTo(b.titolo));

                  if (control == true) {
                    return widget.drinks[index].titolo
                            .toLowerCase()
                            .contains(drinkcercato)
                        ? GestureDetector(
                            onTap: () {
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
                                leading: Hero(
                                  tag: widget.drinks[index].drinkid,
                                  child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 25,
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                              widget.drinks[index].img)),
                                ),
                                title: AutoSizeText(
                                  widget.drinks[index].titolo,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      fontSize: 15),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                              ),
                            ),
                          )
                        : Container();
                  } else {
                    if (widget.drinks[index].vid != '.') {
                      return widget.drinks[index].titolo
                              .toLowerCase()
                              .contains(drinkcercato)
                          ? GestureDetector(
                              onTap: () {
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
                                  leading: Hero(
                                    tag: widget.drinks[index].drinkid,
                                    child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 25,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                                widget.drinks[index].img)),
                                  ),
                                  title: AutoSizeText(
                                    widget.drinks[index].titolo,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        fontSize: 15),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_rounded,
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    } else {
                      return Container();
                    }
                  }
                }))
      ],
    ));
  }

  _title() {
    return MyText(child: 'Cerca');
  }

  _showAlertDialog(context) {
    bool? check1;
    bool? check2;
    if (control == true) {
      check1 = true;
      check2 = false;
    } else {
      check1 = false;
      check2 = true;
    }
    showDialog(
        context: context,
        builder: (context) => Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      border: Border.all(
                        color: Colors.teal,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      title(context),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            control = true;
                            check1 = true;
                            check2 = false;
                            Navigator.pop(context);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyCard(
                            value: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tutti',
                                    style: TextStyle(color: Colors.amber),
                                  ),
                                  Checkbox(
                                    value: check1,
                                    onChanged: (bool? value) {},
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            control = false;
                            check1 = false;
                            check2 = true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyCard(
                            value: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Solo video',
                                      style: TextStyle(color: Colors.amber)),
                                  Checkbox(
                                    value: check2,
                                    onChanged: (bool? value) {},
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  title(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Filtra per :',
          style: TextStyle(fontSize: 15, color: Colors.amber),
        ),
      ),
    );
  }
}
