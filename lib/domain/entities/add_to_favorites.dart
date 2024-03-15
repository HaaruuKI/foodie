// ignore_for_file: non_constant_identifier_names

import 'package:foodie/domain/entities/sing_up.dart';

class AgregarFavoritos {
  static Future<void> AddToFavorite(
      String name, int price, String imgUrl) async {
    final userRef =
        IniciarSesion.databaseRef.child("carts").child(IniciarSesion.user!.uid);
    final productRef = userRef.child(name);

    userRef.child(name).get().then((snapshot) {
      productRef.set({
        "nombre": name,
        "precio": price,
        "imagen": imgUrl,
      });
    });
  }
}
