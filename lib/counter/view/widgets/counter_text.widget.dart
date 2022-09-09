import 'package:cubit_example/counter/cubit/counter.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final counterValue = context.select((CounterCubit cubit) => cubit.state);
    return Text(
      '$counterValue',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
