import 'package:cubit_example/counter/cubit/counter.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(0));

  void increment() {
    CounterState newState = CounterState(state.value + 1);
    emit(newState);
  }

  void decrement() {
    CounterState newState = CounterState(state.value - 1);
    emit(newState);
  }
}
