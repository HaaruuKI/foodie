import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String image, name, description, category;
  final int price;

  //  id;
  // final Color color;

  Product({
    required this.image,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
  });

  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Product(
      category: data['category'],
      name: data['name'],
      price: data['price'],
      description: data['description'],
      image: data['img_url'],
      // color: Color(data['color']),
    );
  }
}

Future<List<Product>> getProductsFromFirestore() async {
  List<Product> products = [];
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('products').get();
  querySnapshot.docs.forEach((doc) {
    products.add(Product.fromFirestore(doc));
  });
  return products;
}
