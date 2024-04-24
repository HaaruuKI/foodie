import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

Widget priceWidget(int? price) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Text(
      "\$${price ?? '00.00'} MXN",
      style: const TextStyle(
        fontSize: 20,
        color: amarillo,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
