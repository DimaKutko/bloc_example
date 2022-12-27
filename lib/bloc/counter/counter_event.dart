import 'package:bloc_example/bloc/counter/counter_state.dart';

abstract class CounterEvent {
  const CounterEvent();

  CounterState call(CounterState state);
}

class CounterIncrementEvent extends CounterEvent {
  @override
  CounterState call(state) {
    return CounterState(state.value + 1, state.operationsCounter + 1);
  }
}

class CounterDecrementEvent extends CounterEvent {
  @override
  CounterState call(state) {
    return CounterState(state.value - 1, state.operationsCounter + 1);
  }
}

class CounterDoubleEvent extends CounterEvent {
  @override
  CounterState call(state) {
    return CounterState(state.value * state.value, state.operationsCounter + 1);
  }
}

class CounterResetEvent extends CounterEvent {
  @override
  CounterState call(state) {
    return const InitialCounterState();
  }
}
