import 'package:flutter/material.dart';

@immutable
class CounterState {
  final int value;
  final int operationsCounter;

  const CounterState(this.value, this.operationsCounter);
}

class InitialCounterState extends CounterState {
  const InitialCounterState() : super(0, 0);
}
