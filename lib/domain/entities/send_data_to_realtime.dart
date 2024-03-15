// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:foodie/domain/entities/log_in.dart';

class SendDataToRealtime {
  static Future<void> EnviarDatosRealtimeDatabase(
      String name, int price, String imgUrl) async {
    final userRef = LogIn.databaseRef.child("carts").child(LogIn.user!.uid);
    final productRef = userRef.child(name);

    userRef.child(name).get().then((snapshot) {
      if (snapshot.exists) {
        // Producto ya existe, actualizar quantity
        int existingQuantity = snapshot.child("quantity").value as int;
        productRef.set({
          "nombre": name,
          "precio": price,
          "imagen": imgUrl,
          "quantity": existingQuantity + 1,
        });
        print('Producto ya existe, actualizar quantity');
      } else {
        // Producto no existe, agregar nuevo
        productRef.set({
          "nombre": name,
          "precio": price,
          "imagen": imgUrl,
          "quantity": 1,
        });
        print('Producto no existe, agregar nuevo');
      }
    });
  }
}
