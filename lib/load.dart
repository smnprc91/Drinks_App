import 'package:flutter/material.dart';
import 'package:progdrinks/Models/categoria.dart';
import 'package:progdrinks/bloc/block.dart';
import 'package:progdrinks/screen/homepage.dart';

class Load extends StatefulWidget {
  const Load({Key? key}) : super(key: key);

  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {
  final Bloc bloc = new Bloc();
  @override
  void initState() {
    super.initState();
    bloc.caricaDati();
  }

  @override
  Widget build(BuildContext context) {
 
    return StreamBuilder(
        stream: bloc.streamCategoria,
        builder: (context, risultatoDelloStream) {
          if (risultatoDelloStream.hasData) {
            List<Categoria>? categorie =
                risultatoDelloStream.data as List<Categoria>?;
            // ignore: unused_local_variable
            var drinks = categorie!
                .map((Categoria c) => c.drinks)
                .toList()
                .expand((e) => e)
                .toList();
            return HomePage(categorie: categorie,drinks: drinks,);
          } else {
            return Container();
          }
        });
  }
}
