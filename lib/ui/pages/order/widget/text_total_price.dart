import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

class textTotalPrice extends StatelessWidget {
  const textTotalPrice({
    super.key,
    required this.totalOrderPrice,
  });

  final int totalOrderPrice;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$$totalOrderPrice', // Mostrar la suma de los totalPrice
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: amarillo,
      ),
    );
  }
}
