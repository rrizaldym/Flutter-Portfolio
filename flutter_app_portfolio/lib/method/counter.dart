import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<int, int>{
  CounterBloc():super(0);

  int? _counter;
  int get counter => _counter!;

  @override
  Stream<int> mapEventToState(event)async*{
    // if(event == )
  }

}