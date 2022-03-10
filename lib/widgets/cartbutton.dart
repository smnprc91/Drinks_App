import 'package:flutter/material.dart';
import 'package:progdrinks/bloc/blocingr.dart';
import 'package:progdrinks/models/ingrediente.dart';

class CartButton extends StatefulWidget {
  const CartButton(
      {Key? key, required this.ingrid, required this.nome, required this.color})
      : super(key: key);
  final int ingrid;
  final String nome;
  final color;
  @override
  _CartButtonState createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  BlocCart _favouriteBloc = BlocCart();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _favouriteBloc.streamcartingr,
        builder: (context, risultatoDelloStream) {
          if (risultatoDelloStream.hasData) {
            List<Ingrediente> ingredienti =
                risultatoDelloStream.data as List<Ingrediente>;
            bool isFavourite = ingredienti
                .where((ingrediente) => ingrediente.ingrid == widget.ingrid)
                .isNotEmpty;
            return Container(
         
              height: MediaQuery.of(context).size.height*0.05,
                child: RawMaterialButton(
                  
                    fillColor: widget.color,
                    shape: CircleBorder(),
                    child: isFavourite
                        ? Icon(
                            Icons.remove_shopping_cart,
                         
                            color: Colors.amber,
                          )
                        : Icon(
                          
                            Icons.add_shopping_cart,
                  
                            color: Colors.amber,
                          ),
                    onPressed: () {
                      isFavourite
                          ? _favouriteBloc.removeFavouriteing(widget.ingrid)
                          : _favouriteBloc.addFavouriteing(widget.ingrid);
                      isFavourite
                          ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(milliseconds: 700),
                              content: Text(widget.nome +
                                  '  rimosso dalla lista della spesa')))
                          : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(milliseconds: 700),
                              content: Text(widget.nome +
                                  '  aggiunto alla lista della spesa')));
                    }));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
