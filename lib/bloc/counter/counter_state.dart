import 'package:built_value/built_value.dart';

part 'counter_state.g.dart';

abstract class CounterState
    implements Built<CounterState, CounterStateBuilder> {
  int get value;
  int get operationsCounter;

  @BuiltValueHook(initializeBuilder: true)
  static void _setDefaults(CounterStateBuilder b) => b
    ..value = 0
    ..operationsCounter = 0;

  CounterState._();

  factory CounterState([void Function(CounterStateBuilder) updates]) =
      _$CounterState;
}
