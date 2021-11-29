import 'package:xml/xml.dart' as xml;



class DayDrinks {
  DayDrinks(this.titolo);

  String titolo;


//TODO: Finire di aggiornare il model 
  static DayDrinks createFromXml(xml.XmlElement node){
    return DayDrinks(
      node.findElements('titolo').first.text
    );
  }
}
