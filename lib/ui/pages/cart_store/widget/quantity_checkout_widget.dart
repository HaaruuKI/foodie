// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget QuantityCheckoutWidget(double totalQuantity) {
  return Text(
    totalQuantity.toStringAsFixed(0),
    style: const TextStyle(fontSize: 20),
  );
}
