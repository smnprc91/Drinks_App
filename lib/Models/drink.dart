import 'package:xml/xml.dart' as xml;

class Drink {
  Drink(
    this.img,
    this.titolo,
    this.difficolta,
    this.tags,
    this.ingredienti,
    this.steps,
  );

  String img;
  String titolo;
  String difficolta;
  List<String> tags;
  List<String> ingredienti;
  List<String> steps;

  static Drink createFromXml(
    xml.XmlElement node,
  ) {
    return Drink(
      node.findElements('img').first.text,
      node.findElements('titolo').first.text,
      node.findElements('difficolta').first.text,
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
          .map((ingrediente) => ingrediente.text)
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
