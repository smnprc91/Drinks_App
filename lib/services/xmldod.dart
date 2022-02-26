import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'dart:async' show Future;
import 'package:progdrinks/models/drinksofday.dart';

class XmlFetchServiceDod {
  static String baseUrl = 'https://sidajo.xyz/xml/';

  static Future<DayDrinks?> fetchDrinkdayXml() async {
    var lingua = 'app-it-dow.xml';
    try {
      return XmlFetchServiceDod.convertTodaydrink(
          (await http.get(Uri.parse(XmlFetchServiceDod.baseUrl + lingua))).body);
    } on Exception catch (_) {
      print("Non Connesso!");
      return null;
    }
  }

  static DayDrinks convertTodaydrink(String node) {
    var document = xml.XmlDocument.parse(node);
    return DayDrinks.createFromXml(document.findAllElements('daydrinks').first);
  }
}
