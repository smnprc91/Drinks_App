import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/bloc/blocingr.dart';
import 'package:progdrinks/models/ingrediente.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/mycard.dart';
import 'package:progdrinks/widgets/text.dart';

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  BlocCart _favouriteBloc = BlocCart();
  @override
  void initState() {
    _favouriteBloc.loadSavedDataCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _favouriteBloc.streamcartingr,
        builder: (context, risultatoDelloStream) {
          if (risultatoDelloStream.hasData) {
            List<Ingrediente> ingredienti =
                risultatoDelloStream.data as List<Ingrediente>;

            if (ingredienti.length == 0) {
              return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: MyAllPagesAppBar(child: _title()),
                body: Container(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Center(
                          child: MyCard(
                        value: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AutoSizeText(
                            'Hey sembra che tu non abbia niente da comprare!',
                            style: TextStyle(
                                color: Theme.of(context).secondaryHeaderColor),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            minFontSize: 17,
                          ),
                        ),
                      )),
                    ),
                  ),
                ),
              );
            } else {
              return Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: MyAllPagesAppBar(
                    child: _title(),
                  ),
                  body: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).primaryColor,
                      child: ListView.builder(
                          itemCount: ingredienti.length,
                          itemBuilder: (context, index) {
                             ingredienti.sort((a, b) => a.nome.compareTo(b.nome));
                            return GestureDetector(
                              onTap: () {},
                              child: MyCard(
                                value: 1,
                                child: ListTile(
                                  leading:  CircleAvatar(
                        backgroundColor: Colors.transparent,        
                        radius: 25,
                        backgroundImage: CachedNetworkImageProvider(
                           ingredienti[index].img)),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(ingredienti[index].nome,style: TextStyle(color: Theme.of(context).secondaryHeaderColor),),
                                      IconButton(
                                          onPressed: () {
                                            _favouriteBloc
                                                .removeFavouriteing(ingredienti[index].ingrid);
                                          },
                                          icon: Icon(Icons.remove_shopping_cart,color: Colors.red
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })));
            }
          } else {
            return Text('');
          }
        });
  }

  _title() {
    return MyText(child: 'Lista della spesa');
  }
}
