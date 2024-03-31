// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/name_shopping_cart.dart';
import 'package:foodie/ui/pages/cart_store/widget/buttom_increment_and_decrement.dart';
import 'package:foodie/ui/pages/cart_store/widget/image_widget.dart';
import 'package:foodie/ui/pages/cart_store/widget/text_name_product_widget.dart';
import 'package:foodie/ui/pages/cart_store/widget/text_price_product_widget.dart';

Widget ExpandedProducts(
    List items, double totalQuantity, BuildContext context) {
  return Expanded(
    child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final img_prduct = item['img'] ?? GetNameShoppingCart.url;
        final name_product = item['name'] ?? 'No hay producto';
        final price_product = '\$${item['price'] ?? 0.toStringAsFixed(2)}';

        return ListTile(
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      child: Container(
                        width: 400,
                        height: 120,
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
                            ]),
                        child: Row(
                          children: [
                            ImageWidget(img_prduct),
                            SizedBox(
                              width: 150,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    TextNameProductWidget(name_product),
                                    TextPriceProductWidget(price_product),
                                  ]),
                            ),
                            ButtomIncrementAndDecrement(
                              item,
                              items,
                              totalQuantity,
                              context,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
