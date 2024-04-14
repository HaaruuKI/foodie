// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget QuantityCheckoutWidget(int totalQuantity) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 10,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Producto:',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          totalQuantity.toStringAsFixed(0),
          style: const TextStyle(fontSize: 20),
        ),
      ],
    ),
  );
}
