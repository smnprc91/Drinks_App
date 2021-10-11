import 'package:progdrinks/Models/categoria.dart';
import 'package:progdrinks/Models/drink.dart';
import 'package:progdrinks/services/xml.dart';
import 'package:rxdart/rxdart.dart';

class Bloc {
  static final Bloc _bloc = Bloc._internal();

  factory Bloc() {
    return _bloc;
  }

  Bloc._internal();

  BehaviorSubject<List<Drink>> _drinks = BehaviorSubject<List<Drink>>();
  BehaviorSubject<List<Categoria>> _categoria =
      BehaviorSubject<List<Categoria>>();

  Sink<List<Drink>> get sinkDrinks => _drinks.sink;
  Stream<List<Drink>> get streamDrinks => _drinks.stream;

  Sink<List<Categoria>> get sinkCategoria => _categoria.sink;
  Stream<List<Categoria>> get streamCategoria => _categoria.stream;

  void caricaDati() async {
    List<Categoria>? categorie = await XmlFetchService.fetchCatXml();
    List <Drink> drinks = categorie!
        .map((Categoria c) => c.drinks)
        .expand((element) => element)
        .toList();

    sinkDrinks.add(drinks);

    sinkCategoria.add(categorie);
  }

  void dispose() {
    _drinks.close();
    _categoria.close();
  }
}
