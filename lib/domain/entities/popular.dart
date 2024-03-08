import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final double price;
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
      name: data['name'],
      price: data['price'],
      img: data['img_url'],
      descripcion: data['description'],
    );
  }
}

class ProductService {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');

  Future<List<Product>> getProducts({int limit = 0, String ordeBy = ''}) async {
    QuerySnapshot querySnapshot =
        await productCollection.orderBy(ordeBy).limit(limit).get();
    return querySnapshot.docs
        .map((doc) =>
            Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }
}
