import 'package:cubit_example/counter/cubit/counter.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterDetailView extends StatelessWidget {
  final int id;
  const CounterDetailView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'ID FROM Route Path ${id.toString()}',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Center(
              child: Text(
                'Value from Cubit State ${context.read<CounterCubit>().state.value.toString()}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
