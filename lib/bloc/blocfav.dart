import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bloc {
  static final Bloc _bloc = Bloc._internal();

  factory Bloc() {
    return _bloc;
  }

  Bloc._internal();
  
  BehaviorSubject<Set<int>> _favdrink = BehaviorSubject();
  Sink<Set<int>> get sinkFavdrink => _favdrink.sink;
  Stream<Set<int>> get streamFavdrink => _favdrink.stream;


  Future<bool> addFavourite(int drinkId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<int> savedDrinks = await loadSavedData();

    savedDrinks.add(drinkId);

    await prefs.setStringList('drinks', savedDrinks.map((drink) => drink.toString()).toList());

    _favdrink.sink.add(savedDrinks);

    return true;
  }

  Future<Set<int>>loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('drinks')!
        .map((drink) => int.parse(drink))
        .toSet();
  }

  void dispose() {
    _favdrink.close();
  }
}