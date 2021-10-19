import 'drink.dart';
import 'package:xml/xml.dart' as xml;

class Categoria {
  Categoria(
    this.img,
    this.titolo,
    this.drinks,
  );
  String img;
  String titolo;
  List<Drink> drinks;

  static Categoria createFromXml(xml.XmlElement document) {
    return Categoria(
        document.findElements('img').first.text,
        document.findElements('titolo').first.text,
        document
            .findElements('drinks')
            .first
            .findElements('drink')
            .map((drink) => Drink.createFromXml(drink))
            .toList());
  }
}
