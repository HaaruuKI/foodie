// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

Widget TextPriceProductWidget(price_product) {
  return Text(
    price_product,
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: amarillo,
    ),
  );
}
