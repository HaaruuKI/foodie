import 'package:firebase_database/firebase_database.dart';

class ProductRealtime {
  final String name;
  final int price;
  final String img;

  ProductRealtime({
    required this.name,
    required this.price,
    required this.img,
  });

  factory ProductRealtime.fromMap(Map<String, dynamic> data, String id) {
    return ProductRealtime(
      name: data['nombre'],
      price: data['precio'],
      img: data['imagen'],
    );
  }
}

class ProductServiceRealtime {
  final DatabaseReference productReference =
      FirebaseDatabase.instance.ref().child('carts');

  Stream<List<ProductRealtime>> getProducts() {
    return productReference.onValue.map((event) {
      List<ProductRealtime> products = [];
      Map<dynamic, dynamic> data =
          event.snapshot.value as Map<dynamic, dynamic>;

      data.forEach((key, value) {
        products.add(ProductRealtime.fromMap(value, key));
      });

      return products;
    });
  }
}

void main() {
  ProductServiceRealtime productService = ProductServiceRealtime();
  Stream<List<ProductRealtime>> productsStream = productService.getProducts();

  productsStream.listen((products) {
    for (ProductRealtime product in products) {
      print('Name: ${product.name}');
      print('Price: ${product.price}');
      print('Image URL: ${product.img}');
      print('------------------------');
    }
  });
}
