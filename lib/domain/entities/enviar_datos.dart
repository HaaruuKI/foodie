// ignore_for_file: non_constant_identifier_names

import 'package:foodie/domain/entities/sing_up.dart';

class EnviarDatos {
  static Future<void> EnviarDatosRealtimeDatabase(
      String name, int price, String imgUrl) async {
    final userRef =
        IniciarSesion.databaseRef.child("carts").child(IniciarSesion.user!.uid);
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
