// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodie/ui/widget/price_checkout.dart';

Widget PriceCheckoutWidget(int totalPrice) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 10,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        priceCheckout(totalPrice),
      ],
    ),
  );
}
