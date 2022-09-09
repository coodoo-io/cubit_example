import 'package:bloc_test/bloc_test.dart';
import 'package:cubit_example/counter/cubit/counter.cubit.dart';
import 'package:cubit_example/counter/view/counter.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

const _buttonIncrementKey = Key('CounterView_Button_increment');
const _buttonDecrementKey = Key('CounterView_Button_decrement');

void main() {
  late CounterCubit counterCubit;

  setUp(() {
    counterCubit = MockCounterCubit();
  });

  group('CounterView', () {
    testWidgets('renders current CounterCubit state', (tester) async {
      when(() => counterCubit.state).thenReturn(42);
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterCubit,
            child: const CounterView(),
          ),
        ),
      );
      expect(find.text('42'), findsOneWidget);
    });

    testWidgets('tapping increment button invokes increment', (tester) async {
      when(() => counterCubit.state).thenReturn(0);
      when(() => counterCubit.increment()).thenReturn(null);
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterCubit,
            child: const CounterView(),
          ),
        ),
      );
      await tester.tap(find.byKey(_buttonIncrementKey));
      verify(() => counterCubit.increment()).called(1);
    });

    testWidgets('tapping decrement button invokes decrement', (tester) async {
      when(() => counterCubit.state).thenReturn(0);
      when(() => counterCubit.decrement()).thenReturn(null);
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterCubit,
            child: const CounterView(),
          ),
        ),
      );
      final decrementFinder = find.byKey(_buttonDecrementKey);
      await tester.ensureVisible(decrementFinder);
      await tester.tap(decrementFinder);
      verify(() => counterCubit.decrement()).called(1);
    });
  });
}