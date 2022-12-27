import 'package:bloc_example/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();

  void call(CounterState state, Emitter<CounterState> emit);
}

class CounterIncrementEvent extends CounterEvent {
  @override
  void call(state, emit) {
    emit(state.rebuild(
      (b) => b
        ..value = state.value + 1
        ..operationsCounter = state.operationsCounter + 1,
    ));
  }
}

class CounterDecrementEvent extends CounterEvent {
  @override
  void call(CounterState state, Emitter<CounterState> emit) {
    emit(state.rebuild(
      (b) => b
        ..value = state.value - 1
        ..operationsCounter = state.operationsCounter + 1,
    ));
  }
}

class CounterDoubleEvent extends CounterEvent {
  @override
  void call(CounterState state, Emitter<CounterState> emit) {
    emit(state.rebuild(
      (b) => b
        ..value = state.value * state.value
        ..operationsCounter = state.operationsCounter + 1,
    ));
  }
}

class CounterResetEvent extends CounterEvent {
  @override
  void call(CounterState state, Emitter<CounterState> emit) {
    emit(state.rebuild(
      (b) => b
        ..value = 0
        ..operationsCounter = state.operationsCounter + 1,
    ));
  }
}
