import 'package:xml/xml.dart' as xml;

class Ingrediente {
  Ingrediente(
    this.ingrid,
    this.nome,
    this.doseparti,
    this.doseml,
  );
  int ingrid;
  String nome;
  String doseparti;
  String doseml;
  static Ingrediente createFromXml(
    xml.XmlElement node,
  ) {
    return Ingrediente(
      int.parse(
        node.findElements('ingrid').first.text,
      ),
      node.findElements('nome').first.text,
      node.findElements('doseparti').first.text,
      node.findElements('doseml').first.text,
    );
  }
}
