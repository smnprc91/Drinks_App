import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:progdrinks/models/categoria.dart';
import 'package:progdrinks/screen/cocktails/cocktailslist.dart';
import 'package:progdrinks/widgets/mycard.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection({Key? key, required this.categorie}) : super(key: key);
  final List<Categoria> categorie;
  @override
  _CarouselSectionState createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  final CarouselController _controller = CarouselController();
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return _bodyElement(widget.categorie);
  }

  _bodyElement(List<Categoria> categorie) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _secondColumnSection(
            categorie,
          ),
          MyCard(
              value: .0,
              child: Column(
                children: [
                  _thirdColumnSection(categorie),
                ],
              )),
      //    _scrollButtonSection()
        ],
      ),
    );
  }

  _secondColumnSection(categorie) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: AutoSizeText(
          'Categorie: ' + widget.categorie[currentImage].titolo,
          style: TextStyle(color: _colText(), fontSize: 15),
          maxLines: 1,
        ),
      ),
    );
  }

  _scrollButtonSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor.withRed(30),
            ),
            onPressed: () {
              _controller.previousPage();
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.amber,
              size: 15,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ElevatedButton(
            child: Icon(
              Icons.arrow_forward_rounded,
              color: Colors.amber,
              size: 15,
            ),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor.withRed(30),
            ),
            onPressed: () {
              _controller.nextPage();
            },
          ),
        ),
      ],
    );
  }

  _colText() {
    if (currentImage == 0) {
      return Theme.of(context).secondaryHeaderColor;
    } else if (currentImage == 1) {
      return Theme.of(context).secondaryHeaderColor;
    } else {
      return Theme.of(context).secondaryHeaderColor;
    }
  }

  _thirdColumnSection(categorie) {
    return CarouselSlider.builder(
        itemCount: categorie.length,
        carouselController: _controller,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          onPageChanged: (index, fn) {
            setState(() {
              currentImage = index;
            });
          },
        ),
        itemBuilder: (
          BuildContext context,
          int index,
          int i,
        ) {
          return Container(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CockTailsPage(
                                      drinks: categorie[index].drinks,
                                      categoria: categorie[index].titolo,
                                    )));
                      },
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: 1000.0,
                        imageUrl: categorie[index].img,
                      ))),
            ),
          );
        });
  }
}
