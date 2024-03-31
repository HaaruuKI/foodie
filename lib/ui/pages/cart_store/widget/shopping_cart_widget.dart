// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/name_shopping_cart.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/ui/pages/cart_store/widget/checkout_container.dart';
import 'package:foodie/ui/pages/cart_store/widget/expanded_product_container.dart';

class ShoppingCartWidget extends StatefulWidget {
  const ShoppingCartWidget({super.key});

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<ShoppingCartWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
            return Column(
              children: [
                ExpandedProducts(items, totalQuantity, context),
                CheckoutContainer(items, totalQuantity, totalPrice, context),
              ],
            );
          }
        }
        return const Center(
          child: Text('No hay productos en el carrito'),
        );
      },
    );
  }
}
