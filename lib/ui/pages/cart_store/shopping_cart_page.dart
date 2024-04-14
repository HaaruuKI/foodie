// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/domain/entities/name_shopping_cart.dart';
import 'package:foodie/ui/pages/cart_store/widget/checkout_container.dart';
import 'package:foodie/ui/pages/cart_store/widget/expanded_container.dart';
import 'package:foodie/ui/widget/btn_back.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: LogIn.databaseRef
            .child(GetNameShoppingCart.get_key_shopping_cart)
            .child(LogIn.user!.uid)
            .onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data =
                snapshot.data!.snapshot.value as Map<dynamic, dynamic>?;
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
              int totalQuantity = 0;
              int totalPrice = 0;

              for (final item in items) {
                int itemQuantity = item['quantity'];
                int itemPrice = item['price'];

                totalQuantity += itemQuantity;
                totalPrice += itemPrice * itemQuantity;
              }
              return Column(
                children: [
                  btnBack(context),
                  expandedProducts(items, totalQuantity, context),
                  checkoutContainer(items, totalQuantity, totalPrice, context),
                ],
              );
            }
          }
          return Center(
            child: Text('No hay productos en el carrito'),
          );
        },
      ),
    );
  }
}
