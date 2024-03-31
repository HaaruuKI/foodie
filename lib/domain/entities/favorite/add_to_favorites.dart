// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/favorite/name_favorite.dart';
import 'package:foodie/domain/entities/log_in.dart';

class AgregarFavoritos {
  static Future<void> AddToFavorite(
      BuildContext context, String name, int price, String imgUrl) async {
    final userRef = LogIn.databaseRef
        .child(GetNameFavorite.get_key_favorite)
        .child(LogIn.user!.uid);
    final productRef = userRef.child(name);

    userRef.child(name).get().then((snapshot) {
      productRef.set({
        GetNameFavorite.get_name_product: name,
        GetNameFavorite.get_price_product: price,
        GetNameFavorite.get_image_product: imgUrl,
      });
    });
  }
}
