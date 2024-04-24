import 'package:flutter/material.dart';

class textPrice extends StatelessWidget {
  const textPrice({
    super.key,
    required this.totalPrice,
  });

  final int totalPrice;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Total: \$${totalPrice.toStringAsFixed(2)}',
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
