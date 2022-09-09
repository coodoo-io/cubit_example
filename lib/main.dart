import 'package:cubit_example/app.dart';
import 'package:cubit_example/app_bloc.observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const keyButtonIncrement = Key('CounterView_Button_increment');
const keyButtonDecrement = Key('CounterView_Button_decrement');

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}
