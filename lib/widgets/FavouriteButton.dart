import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/bloc/blocfav.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({Key? key, required this.drinkid}) : super(key: key);
  final int drinkid;

  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  Bloc _favouriteBloc = Bloc();
  @override
  void initState() {
    inspect(widget.drinkid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: _favouriteBloc.streamFavdrink, builder: (context, risultatoDelloStream) {
      if (risultatoDelloStream.hasData) {
        List<Drink> drinks = risultatoDelloStream.data as List<Drink>;
        bool isFavourite = drinks.where((drink) => drink.drinkid == widget.drinkid).isNotEmpty;
        return Container(
            child: MaterialButton(
              child: isFavourite ? Text('Preferito') : Text('Non Preferito'),
              onPressed: () => _favouriteBloc.addFavourite(widget.drinkid),
            ));
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }
}
