import 'package:flutter/material.dart';
import 'package:progdrinks/screen/detailsscreen/favscreen.dart';






class MyFavButton extends StatefulWidget {
  const MyFavButton({Key? key}) : super(key: key);

  @override
  _MyFavButtonState createState() => _MyFavButtonState();
}

class _MyFavButtonState extends State<MyFavButton> {


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: new BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.4),
                borderRadius: new BorderRadius.all(Radius.circular(20))),
            height: 75,
            width: 100,
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                size: 50,
                color: Colors.amber,
              ),
              onPressed: () {
            pushToFavoriteWordsRoute(context);
              },
            )),
      ),
    );
  }
    Future pushToFavoriteWordsRoute(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) =>FavScreen(
        
        ),
      ),
    );
  }
}
