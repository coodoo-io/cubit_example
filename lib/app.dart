import 'package:cubit_example/counter/view/counter.page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit Example',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const CounterPage(),
    );
  }
}
