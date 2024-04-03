// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget priceOfOrder(int price_of_order) {
  return Text(
    'Total: \$${price_of_order.toStringAsFixed(2)}',
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  );
}
