import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class CounterState extends Equatable {
  final int value;

  const CounterState(this.value);

  @override
  List<Object?> get props => [value];
}
