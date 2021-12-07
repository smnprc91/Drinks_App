import 'package:rxdart/rxdart.dart';

class Bloc {
  static final Bloc _bloc = Bloc._internal();

  factory Bloc() {
    return _bloc;
  }

  Bloc._internal();
  
  BehaviorSubject<List> _favdrink = BehaviorSubject();
  Sink<List> get sinkFavdrink => _favdrink.sink;
  Stream<List> get streamFavdrink => _favdrink.stream;



  void dispose() {
   
    _favdrink.close();
  }
}