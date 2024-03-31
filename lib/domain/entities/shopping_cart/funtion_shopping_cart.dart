// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/domain/entities/name_shopping_cart.dart';

class FuncionShoppingCart {
  static Future<void> UpdateCartData(String key, int newQuantity) async {
    await LogIn.databaseRef
        .child(GetNameShoppingCart.get_key_shopping_cart)
        .child(LogIn.user!.uid)
        .child(key)
        .update({
      GetNameShoppingCart.get_quantity_product: newQuantity,
    });
  }

  static Future<void> DeleteCartData(String key) async {
    await LogIn.databaseRef
        .child(GetNameShoppingCart.get_key_shopping_cart)
        .child(LogIn.user!.uid)
        .child(key)
        .remove();
  }

  static Future<void> IncrementQuantity(String key, List items) async {
    final item = items.firstWhere((item) => item['key'] == key);
    final newQuantity = item[GetNameShoppingCart.get_quantity_product] + 1;
    if (newQuantity > 0) {
      UpdateCartData(key, newQuantity);
    }
  }

  static Future<void> DecrementQuantity(String key, List items,
      double totalQuantity, BuildContext context) async {
    final item = items.firstWhere((item) => item['key'] == key);
    final newQuantity = item[GetNameShoppingCart.get_quantity_product] - 1;
    if (newQuantity >= 1) {
      UpdateCartData(key, newQuantity);
    } else {
      DeleteCartData(key);
      if (totalQuantity <= 1) {
        Navigator.pushNamed(context, 'menu');
      }
    }
  }

  static Future<void> DeleteShoppingCart() async {
    await LogIn.databaseRef
        .child(GetNameShoppingCart.get_key_shopping_cart)
        .child(LogIn.user!.uid)
        .remove();
  }

  static Future<void> AddOrder(BuildContext context, List items,
      double totalPrice, double totalQuantity) async {
    final orderRef = LogIn.databaseRef
        .child(GetNameShoppingCart.get_order_product)
        .child(LogIn.user!.uid);

    final order = {
      "products": items.map((item) {
        return {
          "name": item['name'],
          "price": item['price'],
          "quantity": item['quantity'],
        };
      }).toList(),
      "state": "pendiente",
      "totalPrice": totalPrice,
      "totalQuantity": totalQuantity,
      "timestamp": DateTime.now().microsecondsSinceEpoch,
    };

    await orderRef.push().set(order);

    await DeleteShoppingCart();
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }
}
