import 'package:flutter/material.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/bloc/blocfav.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({Key? key, required this.drinkid, required this.titolo})
      : super(key: key);
  final int drinkid;
  final String titolo;

  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  Bloc _favouriteBloc = Bloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _favouriteBloc.streamFavdrink,
        builder: (context, risultatoDelloStream) {
          if (risultatoDelloStream.hasData) {
            List<Drink> drinks = risultatoDelloStream.data as List<Drink>;
            bool isFavourite = drinks
                .where((drink) => drink.drinkid == widget.drinkid)
                .isNotEmpty;
            return Container(
             
                child: RawMaterialButton(
                  fillColor: Theme.of(context).primaryColor,
                    shape: CircleBorder(),
                    child: isFavourite
                        ? Icon(
                            Icons.favorite_rounded,
                            color: Colors.amber,
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: Colors.amber,
                          ),
                    onPressed: () {
                      isFavourite
                          ? _favouriteBloc.removeFavourite(widget.drinkid)
                          : _favouriteBloc.addFavourite(widget.drinkid);
                      isFavourite
                          ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(milliseconds: 700),
                              content: Text(
                                  widget.titolo + '  rimosso dai preferiti')))
                          : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(milliseconds: 700),
                              content: Text(
                                  widget.titolo + '  aggiunto ai preferiti')));
                    }));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
