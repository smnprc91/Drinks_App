import 'package:xml/xml.dart' as xml;

class News {
  News(
    this.note,
  );
  List<String> note;

  static News createFromXml(xml.XmlElement node) {
    return News(
      node
          .findElements('note')
          .first
          .findElements('nota')
          .map((nota) => nota.text)
          .toList(),
    );
  }
}
