import 'package:progdrinks/models/categoria.dart';
import 'package:progdrinks/models/drink.dart';
import 'package:progdrinks/services/xml.dart';

import 'package:rxdart/rxdart.dart';

class Bloc {
  static final Bloc _bloc = Bloc._internal();

  factory Bloc() {
    return _bloc;
  }

  Bloc._internal();
  BehaviorSubject<Drink> _drinkSelezionato = BehaviorSubject<Drink>();
  BehaviorSubject<List<Drink>> _drinks = BehaviorSubject<List<Drink>>();
  BehaviorSubject<List<Categoria>> _categoria =
      BehaviorSubject<List<Categoria>>();

  Sink<List<Drink>> get sinkDrinks => _drinks.sink;
  Stream<List<Drink>> get streamDrinks => _drinks.stream;
  Sink<Drink> get sinkDrinkSelezionato => _drinkSelezionato.sink;
  Stream<Drink> get streamDrinkSelezionato => _drinkSelezionato.stream;
  Sink<List<Categoria>> get sinkCategoria => _categoria.sink;
  Stream<List<Categoria>> get streamCategoria => _categoria.stream;

  void caricaDati() async {
    List<Categoria>? categorie = await XmlFetchService.fetchCatXml();

    List<Drink> drinks = categorie!
        .map((Categoria c) => c.drinks)
        .expand((element) => element)
        .toList();

    sinkDrinks.add(drinks);
    sinkDrinkSelezionato.add(drinks.first);
    sinkCategoria.add(categorie);
  }

  void dispose() {
    _drinks.close();
    _categoria.close();
    _drinkSelezionato.close();
  }
}
