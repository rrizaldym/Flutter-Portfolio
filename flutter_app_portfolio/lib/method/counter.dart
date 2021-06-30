import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<String, String>{
  CounterBloc():super("oke");

  String? _counter;
  String get counter => _counter!;

  @override
  Stream<String> mapEventToState(event)async*{

  }

}