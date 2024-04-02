// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/domain/entities/name_shopping_cart.dart';

class FuntionShoppingCart {
  static Future<void> EnviarDatosRealtimeDatabase(
      String name, int price, String imgUrl) async {
    final userRef = LogIn.databaseRef
        .child(GetNameShoppingCart.get_key_shopping_cart)
        .child(LogIn.user!.uid);
    final productRef = userRef.child(name);

    userRef.child(name).get().then((snapshot) {
      if (snapshot.exists) {
        // Producto ya existe, actualizar quantity
        int existingQuantity = snapshot
            .child(GetNameShoppingCart.get_quantity_product)
            .value as int;
        productRef.set({
          GetNameShoppingCart.get_name_product: name,
          GetNameShoppingCart.get_price_product: price,
          GetNameShoppingCart.get_image_product: imgUrl,
          GetNameShoppingCart.get_quantity_product: existingQuantity + 1,
        });
        // print('Producto ya existe, actualizar quantity');
      } else {
        // Producto no existe, agregar nuevo
        productRef.set({
          GetNameShoppingCart.get_name_product: name,
          GetNameShoppingCart.get_price_product: price,
          GetNameShoppingCart.get_image_product: imgUrl,
          GetNameShoppingCart.get_quantity_product: 1,
        });
        // print('Producto no existe, agregar nuevo');
      }
    });
  }
}
