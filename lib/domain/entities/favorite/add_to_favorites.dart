// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';

class AgregarFavoritos {
  static Future<void> AddToFavorite(
      BuildContext context, String name, int price, String imgUrl) async {
    final userRef = LogIn.databaseRef.child("favorites").child(LogIn.user!.uid);
    final productRef = userRef.child(name);

    userRef.child(name).get().then((snapshot) {
      productRef.set({
        "name": name,
        "price": price,
        "img_url": imgUrl,
      });
    });
  }
}
