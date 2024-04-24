import 'package:flutter/material.dart';

class textDate extends StatelessWidget {
  const textDate({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        'Fecha: $date',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
