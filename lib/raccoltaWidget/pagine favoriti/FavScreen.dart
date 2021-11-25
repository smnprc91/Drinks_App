import 'package:flutter/material.dart';
import 'package:progdrinks/Models/drink.dart';
import 'package:progdrinks/bloc/block.dart';
import 'package:progdrinks/raccoltaWidget/pagine%20favoriti/dettaglio.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  var index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Bloc().streamLezzo,
        builder: (context, AsyncSnapshot<List> risultatoStream) {
          if (risultatoStream.hasData) {
            return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.amber,
                child: ListView.builder(
                    itemCount: risultatoStream.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dettaglio(
                                            drink:  risultatoStream.data![index],
                                          )));
                        },
                        child: ListTile(
                          title: GestureDetector(
                            child: Text(risultatoStream.data![index].titolo)),
                        ),
                      );
                    }));
          } else {
            return Container(
              child: Center(child: Text('')),
            );
          }
        },
      ),
    );
  }

  /**Center(child: Text(risultatoStream.data![index].titolo)), */
}
