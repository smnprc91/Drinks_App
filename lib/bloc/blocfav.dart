import 'package:progdrinks/models/drink.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bloc {
  static final Bloc _bloc = Bloc._internal();

  factory Bloc() {
    return _bloc;
  }

  Bloc._internal();

  BehaviorSubject<List<Drink>> _favdrink = BehaviorSubject();
  Sink<List<Drink>> get sinkFavdrink => _favdrink.sink;
  Stream<List<Drink>> get streamFavdrink => _favdrink.stream;

  Set<int> _savedDrinks = new Set();
  List<Drink> drinks = [];

  Future<bool> addFavourite(int drinkId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await loadSavedData();

    _savedDrinks.add(drinkId);

    await prefs.setStringList(
        'drinks', _savedDrinks.map((drink) => drink.toString()).toList());

    _favdrink.sink.add(_mapIdsToDrinks());

    return true;
  }

  Future<bool> removeFavourite(int drinkId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await loadSavedData();

    _savedDrinks.remove(drinkId);

    await prefs.setStringList(
        'drinks', _savedDrinks.map((drink) => drink.toString()).toList());

    _favdrink.sink.add(_mapIdsToDrinks());

    return true;
  }

  List<Drink> _mapIdsToDrinks() {
    return _savedDrinks.where((id) {
      return drinks.where((drink) => drink.drinkid== id).isNotEmpty;
    }).map((id) {
      return drinks.where((drink) => drink.drinkid == id).first;
    }).toList();
  }

  Future<Set<int>> loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? fetchedDrinks = prefs.getStringList('drinks');

    if (fetchedDrinks != null) {
      _savedDrinks = fetchedDrinks.map((drink) => int.parse(drink)).toSet();
    }

    _favdrink.sink.add(_mapIdsToDrinks());

    return _savedDrinks;
  }

  bool isFavourite(int drinkId) {
    return _savedDrinks.contains(drinkId);
  }

  void dispose() {
    _favdrink.close();
  }
}
