import 'package:bloc_example/bloc/counter/counter_event.dart';
import 'package:bloc_example/bloc/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc({int initValue = 0}) : super(InitialCounterState()) {
    on<CounterEvent>((event, emit) => emit(event.call(state)));
  }
}
