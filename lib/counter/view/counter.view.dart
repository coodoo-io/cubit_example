import 'package:cubit_example/counter/cubit/counter.cubit.dart';
import 'package:cubit_example/counter/view/widgets/counter_text.widget.dart';
import 'package:cubit_example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            CounterText(),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'forward',
            key: keyButtonForward,
            onPressed: () {
              GoRouter.of(context).go('/counter/${0}');
            },
            tooltip: 'Detail Page',
            child: const Icon(Icons.arrow_forward_ios_outlined),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'increment',
            key: keyButtonIncrement,
            onPressed: () => counterCubit.increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'decrement',
            key: keyButtonDecrement,
            onPressed: () => counterCubit.decrement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
