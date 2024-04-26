// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/shopping_cart/widget/button_increase_and_decrease.dart';
import 'package:foodie/ui/pages/shopping_cart/widget/container_price_and_name.dart';
import 'package:foodie/ui/widget/image_widget.dart';

Widget expandedProducts(List items, int totalQuantity, BuildContext context) {
  return Expanded(
    child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final String img = item['img'];
        final String name = item['name'];
        final int price = item['price'];

        return ListTile(
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      imageWidget(img),
                      containerPriceAndName(name, price),
                      buttomIncrementAndDecrement(
                          item, items, totalQuantity, context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
