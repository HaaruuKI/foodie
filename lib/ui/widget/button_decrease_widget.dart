import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/shopping_cart/funtion_shopping_cart.dart';

Widget buttonDecreaseWidget(Map<String, dynamic> item, List items,
    int totalQuantity, BuildContext context) {
  return IconButton(
    onPressed: () {
      FuncionShoppingCart.DecrementQuantity(
          item['key'], items, totalQuantity, context);
    },
    icon: const Icon(
      Icons.remove,
      color: Colors.black,
    ),
  );
}
