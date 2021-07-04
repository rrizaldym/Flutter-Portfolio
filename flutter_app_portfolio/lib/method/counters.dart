import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<String, String> {
  CounterBloc() : super('');
  // String? _counter;
  @override
  Stream<String> mapEventToState(event) async* {
    String _counter = event;

    // throw UnimplementedError();
    yield _counter;
  }
}
