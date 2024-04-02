// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/domain/entities/name_shopping_cart.dart';
import 'package:foodie/ui/pages/cart_store/widget/price_checkout.dart';
import 'package:foodie/ui/pages/details/widget/buttom_add.dart';

Widget ContainerBar(
    String? name, int? price, String? img, BuildContext context) {
  return BottomAppBar(
    child: StreamBuilder(
      stream: LogIn.databaseRef
          .child(GetNameShoppingCart.get_key_shopping_cart)
          .child(LogIn.user!.uid)
          .onValue,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>?;
          if (data != null) {
            final List<Map<String, dynamic>> items = [];
            data.forEach((key, value) {
              final product = Map<String, dynamic>.from(value as dynamic);
              items.add({
                'key': key,
                'name': product[GetNameShoppingCart.get_name_product],
                'price': product[GetNameShoppingCart.get_price_product],
                'img': product[GetNameShoppingCart.get_image_product],
                'quantity': product[GetNameShoppingCart.get_quantity_product],
              });
            });
            double totalQuantity = 0;
            double totalPrice = 0;

            totalQuantity = totalQuantity.toDouble();
            totalPrice = totalPrice.toDouble();

            for (final item in items) {
              totalQuantity += item['quantity'];
              totalPrice += item['price'] * item['quantity'];
            }
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 70,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        PriceCheckoutWidget(totalPrice),
                      ],
                    ),
                    ButtomAdd(name, price, img, context)
                  ]),
            );
          }
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  PriceCheckoutWidget(0.00),
                ],
              ),
              ButtomAdd(name, price, img, context)
            ],
          ),
        );
      },
    ),
  );
}
