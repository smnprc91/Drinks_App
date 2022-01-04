import 'dart:developer';

import 'package:flutter/material.dart';
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
    return Container(
        child: MaterialButton(
      child: Text('Preferito'),
      onPressed: () => _favouriteBloc.addFavourite(widget.drinkid),
    ));
  }
}
