// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/cart_store/widget/price_checkout.dart';
import 'package:foodie/ui/pages/cart_store/widget/quantity_checkout.dart';
import 'package:foodie/ui/widget/button_pay_widget.dart';

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
                child:
                    buttonPayWidget(totalPrice, totalQuantity, items, context),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
