import 'package:foodie/domain/entities/log_in.dart';

class GetCartDataRealtime {
  List<Map<String, dynamic>> items = [];

  double totalQuantity = 0;
  double totalPrice = 0;

  static Future<void> GetCartData() async {
    final cartRef = LogIn.databaseRef.child("carts").child(LogIn.user!.uid);
    final snapshot = await cartRef.once();
    final data = snapshot.snapshot.value as Map<dynamic, dynamic>?;
    if (data != null) {
      final List<Map<String, dynamic>> items = [];
      data.forEach((key, value) {
        final product = Map<String, dynamic>.from(value as dynamic);
        items.add({
          'key': key,
          'name': product['nombre'],
          'price': product['precio'],
          'img': product['imagen'],
          'quantity': product['quantity'],
        });
      });
      print(items[0]['name']);
      // // if (mounted) {
      // setState(() {
      //   this.items = items;
      //     totalQuantity = 0;
      //     totalPrice = 0;
      //     for (final item in items) {
      //       totalQuantity += item['quantity'];
      //       totalPrice += item['quantity'] * item['price'];
      //     }
      //     totalQuantity = totalQuantity.toDouble();
      //     totalPrice = totalPrice.toDouble();
      // });
      // }
    }
  }
}
