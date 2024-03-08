// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie/ui/pages/categories/categories.dart';
import 'package:foodie/ui/pages/explore_tab/widget/more_widget.dart';
import 'package:foodie/ui/pages/popular/popular_page.dart';
import 'package:foodie/ui/widget/btn_cart.dart';
import 'package:foodie/ui/widget/search.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  _ExploreTabState createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              const Search(),
              Categories(),
              const PopularesItemWidget(),
              const MoreWidget(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      floatingActionButton: btn_cart(context),
    );
  }
}

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
      FirebaseFirestore.instance.collection('productos');

  Future<List<Product>> getProducts({int limit = 0, String ordeBy = ''}) async {
    QuerySnapshot querySnapshot =
        await productCollection.orderBy(ordeBy).limit(limit).get();
    return querySnapshot.docs
        .map((doc) =>
            Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }
}

class DatabaseFields {
  static const String nombre = "name";
  static const String precio = "price";
  static const String imagen = "img_url";
}

void addToFavorites(Product product) {
  User? user;

  final FirebaseDatabase database = FirebaseDatabase.instance;
  final DatabaseReference _databaseRef = database.ref();

  final productRef =
      _databaseRef.child("favorites").child(user!.uid).child(product.name);

  productRef.set({
    DatabaseFields.nombre: product.name,
    DatabaseFields.precio: product.price,
    DatabaseFields.imagen: product.img,
  });
}
