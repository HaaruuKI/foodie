import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

Widget TextPrice(int? price) {
  return Text(
    '\$ ${price ?? ''}',
    style: const TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: amarillo),
  );
}

Widget TextPriceTotal() {
  return Text(
    'Total: \$ 0.00',
    style: const TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: amarillo),
  );
}
