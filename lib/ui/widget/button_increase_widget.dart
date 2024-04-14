import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/shopping_cart/funtion_shopping_cart.dart';

Widget buttonIncreaseWidget(Map<String, dynamic> item, List items) {
  return IconButton(
    onPressed: () {
      FuncionShoppingCart.IncrementQuantity(item['key'], items);
    },
    icon: const Icon(
      Icons.add,
      color: Colors.black,
    ),
  );
}
