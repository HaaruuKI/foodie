import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

Widget priceCheckout(int? totalPrice) {
  return Text(
    '\$${totalPrice ?? '0'} MXN ',
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: amarillo,
    ),
  );
}
