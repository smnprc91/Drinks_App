import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/bloc/blocingr.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/models/ingrediente.dart';
import 'package:progdrinks/widgets/cartbutton.dart';
import 'package:progdrinks/widgets/mycard.dart';

class IngredientSection extends StatefulWidget {
  const IngredientSection({Key? key, required this.drink}) : super(key: key);
  final Drink drink;
  @override
  _IngredientSectionState createState() => _IngredientSectionState();
}

class _IngredientSectionState extends State<IngredientSection> {
  BlocCart blocCart = BlocCart();
  var check = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 15),
      child: MyCard(
        value: 8.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText('Ingredienti :',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.w700,
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AutoSizeText('Unità di misura :  ',
                    style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).secondaryHeaderColor,
                        fontStyle: FontStyle.italic)),
                rowBUtton(context),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ingredientList(widget.drink),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> ingredientList(Drink drink) {
    return widget.drink.ingredienti.map((ingrediente) {
      return Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: MyCard(
          value: 10,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  ingrediente.nome + ' :  ' + ingr(ingrediente),
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 15),
                ),
                CartButton(
                    ingrid: ingrediente.ingrid,
                    nome: ingrediente.nome,
                    color: Theme.of(context).primaryColor)
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  ingr(Ingrediente ingrediente) {
    if (check == true) {
      return ingrediente.doseparti;
    } else {
      return ingrediente.doseml;
    }
  }

  rowBUtton(context) {
    return Row(
      children: [
        TextButton(
            style: TextButton.styleFrom(
              backgroundColor:
                  check == false ? Colors.teal : Colors.transparent,
              primary: check == false
                  ? Colors.amber
                  : Theme.of(context).secondaryHeaderColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            onPressed: () {
              setState(() {
                check = false;
              });
            },
            child: Text('ML')),
        TextButton(
            style: TextButton.styleFrom(
              backgroundColor: check == true ? Colors.teal : Colors.transparent,
              primary: check == true
                  ? Colors.amber
                  : Theme.of(context).secondaryHeaderColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            onPressed: () {
              setState(() {
                check = true;
              });
            },
            child: Text('Oz')),
      ],
    );
  }
}
