import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie/domain/entities/products/name_products.dart';

class Product {
  final String id;
  final String name;
  final int price;
  final String img;
  final String descripcion;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.img,
    required this.descripcion,
  });

  factory Product.fromMap(Map<String, dynamic> data, String id) {
    return Product(
      id: id,
      name: data[GetNameProducts.get_name_products],
      price: data[GetNameProducts.get_price_products],
      img: data[GetNameProducts.get_image_products],
      descripcion: data[GetNameProducts.get_description_products],
    );
  }
}

class ProductService {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection(GetNameProducts.get_key_products);

  Future<List<Product>> getProducts({int limit = 0, String ordeBy = ''}) async {
    QuerySnapshot querySnapshot =
        await productCollection.orderBy(ordeBy).limit(limit).get();
    return querySnapshot.docs
        .map((doc) =>
            Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }
}
