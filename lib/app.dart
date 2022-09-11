import 'package:cubit_example/counter/cubit/counter.cubit.dart';
import 'package:cubit_example/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: MaterialApp.router(
        title: 'Cubit Example',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        routeInformationProvider: routerDefinition.routeInformationProvider,
        routeInformationParser: routerDefinition.routeInformationParser,
        routerDelegate: routerDefinition.routerDelegate,
      ),
    );
  }
}
