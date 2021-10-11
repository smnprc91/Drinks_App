import 'package:http/http.dart' as http;
import 'package:progdrinks/Models/categoria.dart';
import 'package:progdrinks/Models/intro.dart';
import 'package:xml/xml.dart' as xml;
import 'dart:async' show Future;

class XmlFetchService {
  // 'https://app.sorso360.com/xml/app-it.xml';
  //'https://sidajo.xyz/public_www/lezzo.xml';
  static String baseUrl = 'https://sidajo.xyz/bo/';

  static Future<List<Categoria>?> fetchCatXml() async {
    var lingua = 'app-it.xml';
    try {
      return XmlFetchService.convertToCategories(
          (await http.get(Uri.parse(XmlFetchService.baseUrl + lingua))).body);
    } on Exception catch (_) {
      print("Non Connesso!");
      return null;
    }
  }

  static List<Categoria> convertToCategories(String node) {
    var document = xml.XmlDocument.parse(node);
    return document
        .findAllElements('categoria')
        .map((categoria) => Categoria.createFromXml(categoria))
        .toList();
  }

  static Future<Intro?> fetchIntroXml() async {
    var lingua = 'intro-it.xml';

    try {
      return XmlFetchService.convertToIntro(
          (await http.get(Uri.parse(XmlFetchService.baseUrl + lingua))).body);
    } on Exception catch (_) {
      print('non connesso!');
      return null;
    }
  }

  static Intro convertToIntro(String node) {
    var document = xml.XmlDocument.parse(node);

    return Intro.createFromXml(document.findAllElements('intro').first);
  }
}
