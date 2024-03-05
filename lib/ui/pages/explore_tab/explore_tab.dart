// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodie/ui/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie/ui/pages/explore_tab/widget/Popular_widget.dart';
import 'package:foodie/ui/pages/explore_tab/widget/categories_widget.dart';
import 'package:foodie/ui/pages/explore_tab/widget/more_widget.dart';

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
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'search');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 50,
                    horizontal: 15,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(children: [
                        Icon(
                          CupertinoIcons.search,
                          color: Color.fromARGB(255, 243, 164, 16),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text('Buscar...'),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              const CategoriasWidget(),
              const PopularesItemWidget(),
              const MoreWidget(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'cartPage');
        },
        backgroundColor: Colors.white,
        child: const Icon(
          CupertinoIcons.cart,
          size: 28,
          color: amarillo,
        ),
      ),
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
      name: data['nombre'],
      price: data['precio'],
      img: data['imagen'],
      descripcion: data['descripcion'],
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
  static const String nombre = "nombre";
  static const String precio = "precio";
  static const String imagen = "imagen";
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
