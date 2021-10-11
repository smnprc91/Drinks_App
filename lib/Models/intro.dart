
import 'package:xml/xml.dart' as xml;

class Intro {
  Intro(
      this.introduzione,
      this.titolo,
      this.sottotitolo,
      this.istituzioni,
      this.collaboratori,
      this.linkimmagine,
      this.immaginetutorial,
      this.titolone);
  String introduzione;
  String titolo;
  String sottotitolo;
  List<String> istituzioni;
  List<String> collaboratori;

  String linkimmagine;
  String immaginetutorial;
  String titolone;
  static  Intro createFromXml(xml.XmlElement node) {
    return Intro(
        node.findElements('introduzione').first.text,
        node.findElements('titolo').first.text,
        node.findElements('sottotitolo').first.text,
        node
            .findElements('istituzioni')
            .first
            .findElements('istituzione')
            .map((istituzione) => istituzione.text)
            .toList(),
        node
            .findElements('collaboratori')
            .first
            .findElements('collaboratore')
            .map((collaboratore) => collaboratore.text)
            .toList(),
        node.findElements('linkimmagine').first.text,
        node.findElements('immaginetutorial').first.text,
        node.findElements('titolone').first.text);
  }
}
