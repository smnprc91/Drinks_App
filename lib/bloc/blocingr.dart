
import 'package:progdrinks/models/ingrediente.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlocCart {
  static final BlocCart _blocingr = BlocCart._internal();

  factory BlocCart() {
    return _blocingr;
  }

  BlocCart._internal();

  BehaviorSubject<List<Ingrediente>> _cartingr = BehaviorSubject();
  Sink<List<Ingrediente>> get sinkcartingr => _cartingr.sink;
  Stream<List<Ingrediente>> get streamcartingr => _cartingr.stream;

  Set<int> _savedIngrs = new Set();
  List<Ingrediente> ingredienti = [];

  Future<bool> addFavouriteing(int ingrId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await loadSavedDataCart();

    _savedIngrs.add(ingrId);

    await prefs.setStringList(
        'ingredienti', _savedIngrs.map((ingrediente) => ingrediente.toString()).toList());

    _cartingr.sink.add(_mapIdsToIngr());

    return true;
  }

  Future<bool> removeFavouriteing(int ingrId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await loadSavedDataCart();

    _savedIngrs.remove(ingrId);

    await prefs.setStringList(
        'ingredienti', _savedIngrs.map((ingrediente) => ingrediente.toString()).toList());

    _cartingr.sink.add(_mapIdsToIngr());

    return true;
  }

  List<Ingrediente> _mapIdsToIngr() {
    return _savedIngrs.where((id) {
      return ingredienti.where((ingrediente) => ingrediente.ingrid == id).isNotEmpty;
    }).map((id) {
      return ingredienti.where((ingrediente) => ingrediente.ingrid == id).first;
    }).toList();
  }

  Future<Set<int>> loadSavedDataCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? fetchedIngredienti = prefs.getStringList('ingredienti');

    if (fetchedIngredienti != null) {
      _savedIngrs = fetchedIngredienti.map((ingrediente) => int.parse(ingrediente)).toSet();
    }

    _cartingr.sink.add(_mapIdsToIngr());

    return _savedIngrs;
  }

  bool isFavourite(int ingrId) {
    return _savedIngrs.contains(ingrId);
  }

  void dispose() {
    _cartingr.close();
  }
}
