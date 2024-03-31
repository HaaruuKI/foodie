// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/shopping_cart/funtion_shopping_cart.dart';
import 'package:foodie/ui/colors.dart';

Widget ButtomPay(
    double totalPrice, double totalQuantity, List items, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 10,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        ElevatedButton(
          onPressed: () => FuncionShoppingCart.AddOrder(
              context, items, totalPrice, totalQuantity),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => amarillo)),
          child: const Text(
            'Pagar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
