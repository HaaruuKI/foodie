// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/shopping_cart/funtion_shopping_cart.dart';
import 'package:foodie/ui/colors.dart';
import 'package:foodie/ui/pages/shopping_cart/widget/price_checkout.dart';
import 'package:foodie/ui/pages/shopping_cart/widget/quantity_checkout.dart';

Widget checkoutContainer(
    List items, int totalQuantity, int totalPrice, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          QuantityCheckoutWidget(totalQuantity),
          const Divider(
            color: Colors.black,
          ),
          PriceCheckoutWidget(totalPrice),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: ElevatedButton(
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
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
