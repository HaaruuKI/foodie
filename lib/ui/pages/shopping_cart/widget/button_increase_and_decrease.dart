import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/shopping_cart/funtion_shopping_cart.dart';

Widget buttomIncrementAndDecrement(Map<String, dynamic> item, List items,
    int totalQuantity, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {
          FuncionShoppingCart.IncrementQuantity(item['key'], items);
        },
        icon: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      Text(
        '${item['quantity'] ?? 0}',
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      IconButton(
        onPressed: () {
          FuncionShoppingCart.DecrementQuantity(
              item['key'], items, totalQuantity, context);
        },
        icon: const Icon(
          Icons.remove,
          color: Colors.black,
        ),
      ),
    ],
  );
}
