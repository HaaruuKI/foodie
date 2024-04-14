// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/domain/entities/name_shopping_cart.dart';
import 'package:uuid/uuid.dart';

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

  static Future<void> DecrementQuantity(
      String key, List items, int totalQuantity, BuildContext context) async {
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

  static Future<void> AddOrder(BuildContext context, List items, int totalPrice,
      int totalQuantity) async {
    final uuid = Uuid().v4(); // Generate a new UUID for each order

    Map<String, dynamic> order = {
      'key': uuid,
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
    print('uuid addOrder: $uuid');

    DocumentReference<Map<String, dynamic>> docDataSend =
        FirebaseFirestore.instance.collection('orders').doc(LogIn.user!.uid);

    await docDataSend.set({uuid.toString(): order}, SetOptions(merge: true));
    addOrderForAdmin(context, items, totalPrice, totalQuantity, uuid);
    await DeleteShoppingCart();
    Navigator.pop(context);
  }

  static Future<void> addOrderForAdmin(BuildContext context, List items,
      int totalPrice, int totalQuantity, String orderId) async {
    Map<String, dynamic> order = {
      "user": LogIn.user!.uid,
      "products_list": items.map((item) {
        return {
          "name": item['name'],
          "price": item['price'],
          "quantity": item['quantity'],
        };
      }).toList(),
      "uuid": orderId,
      "name_user": LogIn.userName,
      "state": "pendiente",
      "totalPrice": totalPrice,
      "totalQuantity": totalQuantity,
      "timestamp": DateTime.now().microsecondsSinceEpoch,
    };
    // print('uuid addOrderForAdmin: $orderId');
    DocumentReference<Map<String, dynamic>> docDataSend = FirebaseFirestore
        .instance
        .collection('orders_for_admin')
        .doc('productos');

    await docDataSend.set({orderId: order}, SetOptions(merge: true));
  }
}
