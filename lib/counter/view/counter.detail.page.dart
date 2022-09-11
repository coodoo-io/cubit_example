import 'package:cubit_example/counter/view/counter.detail.view.dart';
import 'package:flutter/material.dart';

class CounterDetailPage extends StatelessWidget {
  final int id;
  const CounterDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return CounterDetailView(
      id: id,
    );
  }
}
