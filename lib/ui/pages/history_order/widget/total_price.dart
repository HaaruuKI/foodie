import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

Widget totalPriceWidget(double totalPrice) {
  return Text(
    '\$${totalPrice.toStringAsFixed(2)}',
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: amarillo,
    ),
  );
}
