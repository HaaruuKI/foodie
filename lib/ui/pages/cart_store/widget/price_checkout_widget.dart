// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

Widget PriceCheckoutWidget(double totalPrice) {
  return Text(
    '\$${totalPrice.toStringAsFixed(2)}',
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: amarillo,
    ),
  );
}
