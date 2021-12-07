import 'package:flutter/material.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/bloc/blocfav.dart';
import 'package:progdrinks/screen/detailsscreen/details.dart';
import 'package:progdrinks/screen/drawer/drawer.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:progdrinks/widgets/myappbar.dart';


class FavScreen extends StatefulWidget {
  const FavScreen({
    Key? key,
  }) : super(key: key);
  static const String routeName = 'favourites';

  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  final Bloc bloc = new Bloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.streamFavdrink,
        builder: (context, risultatoDelloStream) {
          if (risultatoDelloStream.hasData) {
            List<Drink> drinks = risultatoDelloStream.data as List<Drink>;

            return Scaffold(
              appBar: MyAllPagesAppBar(),
           
                body: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.amber,
                    child: ListView.builder(
                        itemCount: drinks.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dettaglio(
                                            drink: drinks[index],
                                          )));
                            },
                            child: ListTile(
                              title: GestureDetector(
                                  child: Text(drinks[index].titolo)),
                            ),
                          );
                        })));
          } else {
            return Scaffold(
        
             appBar: MyAllPagesAppBar(),
              body: Container(
              color: Colors.blue,
            ),
            );
          }
        });
  }
}
