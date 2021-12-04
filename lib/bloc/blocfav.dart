import 'package:rxdart/rxdart.dart';

class Bloc {
  static final Bloc _bloc = Bloc._internal();

  factory Bloc() {
    return _bloc;
  }

  Bloc._internal();
  
  BehaviorSubject<List> _lezzo = BehaviorSubject();
  Sink<List> get sinkLezzo => _lezzo.sink;
  Stream<List> get streamLezzo => _lezzo.stream;



  void dispose() {
   
    _lezzo.close();
  }
}