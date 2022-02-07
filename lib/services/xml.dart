import 'package:http/http.dart' as http;
import 'package:progdrinks/models/categoria.dart';
import 'package:progdrinks/models/news.dart';
import 'package:xml/xml.dart' as xml;
import 'dart:async' show Future;

class XmlFetchService {

  static String baseUrl = 'https://sidajo.xyz/bo/';

  static Future<List<Categoria>?> fetchCatXml() async {
    var lingua = 'drink-it.xml';
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






  static Future<News?> fetchNoteXml() async {
    var lingua = 'note.xml';
    try {
      return XmlFetchService.convertToNote(
          (await http.get(Uri.parse(XmlFetchService.baseUrl + lingua))).body);
    } on Exception catch (_) {
      print("Non Connesso!");
      return null;
    }
  }

  static News convertToNote(String node) {
    var document = xml.XmlDocument.parse(node);
    return News.createFromXml(document.findAllElements('news').first);
  }

  static fetchDayXml() {}
}
