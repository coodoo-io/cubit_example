import 'package:bloc_test/bloc_test.dart';
import 'package:cubit_example/counter/cubit/counter.cubit.dart';
import 'package:cubit_example/counter/cubit/counter.state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is 0', () {
      expect(CounterCubit().state.value, 0);
    });

    group('increment', () {
      blocTest<CounterCubit, CounterState>(
        'emits [1] when state is 0',
        build: CounterCubit.new,
        act: (cubit) => cubit.increment(),
        expect: () => <CounterState>[const CounterState(1)],
      );

      blocTest<CounterCubit, CounterState>(
        'emits [1, 2] when state is 0 and invoked twice',
        build: CounterCubit.new,
        act: (cubit) => cubit
          ..increment()
          ..increment(),
        expect: () => const <CounterState>[CounterState(1), CounterState(2)],
      );

      blocTest<CounterCubit, CounterState>(
        'emits [42] when state is 41',
        build: CounterCubit.new,
        seed: () => const CounterState(41),
        act: (cubit) => cubit.increment(),
        expect: () => const <CounterState>[CounterState(42)],
      );
    });

    group('decrement', () {
      blocTest<CounterCubit, CounterState>(
        'emits [-1] when state is 0',
        build: CounterCubit.new,
        act: (cubit) => cubit.decrement(),
        expect: () => const <CounterState>[CounterState(-1)],
      );

      blocTest<CounterCubit, CounterState>(
        'emits [-1, -2] when state is 0 and invoked twice',
        build: CounterCubit.new,
        act: (cubit) => cubit
          ..decrement()
          ..decrement(),
        expect: () => const <CounterState>[CounterState(-1), CounterState(-2)],
      );

      blocTest<CounterCubit, CounterState>(
        'emits [42] when state is 43',
        build: CounterCubit.new,
        seed: () => const CounterState(43),
        act: (cubit) => cubit.decrement(),
        expect: () => const <CounterState>[CounterState(42)],
      );
    });
  });
}
