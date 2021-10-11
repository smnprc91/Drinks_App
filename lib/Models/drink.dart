import 'package:xml/xml.dart' as xml;

class Drink {
  Drink(this.img);

  String img;

  static Drink createFromXml(xml.XmlElement node,) {
    return Drink(
     
      node.findElements('img').first.text
    );
  }
}
