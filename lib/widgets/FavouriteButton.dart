import 'package:flutter/material.dart';
import 'package:progdrinks/bloc/blocfav.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({Key? key, required this.drinkId}) : super(key: key);
  final int drinkId;

  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  Bloc _favouriteBloc = Bloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        child: Text('Preferito'),
        onPressed: () => _favouriteBloc.addFavourite(widget.drinkId),
      )
    );
  }
}
