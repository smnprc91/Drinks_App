import 'package:progdrinks/models/ingrediente.dart';
import 'package:xml/xml.dart' as xml;

class DayDrinks {
  DayDrinks(
    this.img,
    this.titolo,
    this.difficolta,
    this.tags,
    this.ingredienti,
    this.steps,
  );
  String img;
  String titolo;
  int difficolta;
  List<String> tags;
  List<Ingrediente> ingredienti;
  List<String> steps;

  static DayDrinks createFromXml(xml.XmlElement node) {
    return DayDrinks(
      node.findElements('img').first.text,
      node.findElements('titolo').first.text,
      int.parse(
        node.findElements('difficolta').first.text,
      ),
      node
          .findElements('tags')
          .first
          .findElements('tag')
          .map((tag) => tag.text)
          .toList(),
      node
          .findElements('ingredienti')
          .first
          .findElements('ingrediente')
          .map((ingrediente) => Ingrediente.createFromXml(ingrediente))
          .toList(),
      node
          .findElements('steps')
          .first
          .findElements('step')
          .map((step) => step.text)
          .toList(),
    );
  }
}
