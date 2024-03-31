import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/shopping_cart/funtion_shopping_cart.dart';
import 'package:foodie/ui/colors.dart';

Widget ButtomPay(
    double totalPrice, double totalQuantity, List items, BuildContext context) {
  return ElevatedButton(
    onPressed: () =>
        FuncionShoppingCart.AddOrder(context, items, totalPrice, totalQuantity),
    style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => amarillo)),
    child: const Text(
      'Pagar',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
