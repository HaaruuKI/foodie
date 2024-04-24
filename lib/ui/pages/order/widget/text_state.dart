import 'package:flutter/material.dart';

class textState extends StatelessWidget {
  const textState({
    super.key,
    required this.state,
  });

  final state;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Estado: $state',
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
