import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class EnviarDatos {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  String userEmail = "";
  String userName = "";

  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final FirebaseDatabase database = FirebaseDatabase.instance;

  void initState() {
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    user = _auth.currentUser;
    if (user != null) {
      await _getUserData();
    }
  }

  Future<void> _getUserData() async {
    if (user!.providerData
        .any((provider) => provider.providerId == 'google.com')) {
      _getGoogleUserData();
    } else {
      _getEmailPasswordUserData();
    }
  }

  Future<void> _getGoogleUserData() async {
    userName = user!.displayName ?? "";
    userEmail = user!.email ?? "";
  }

  Future<void> _getEmailPasswordUserData() async {
    final userData = await firestore.collection('Users').doc(user!.uid).get();
    if (userData.exists) {
      userName = userData.get('name');
      userEmail = userData.get('email');
    }
  }

  final DatabaseReference _databaseRef = database.ref();

  void enviarDatosRealtimeDatabase(String name, double price, String imgUrl) {
    final userRef = _databaseRef.child("carts").child(user!.uid);
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
      } else {
        // Producto no existe, agregar nuevo
        productRef.set({
          "nombre": name,
          "precio": price,
          "imagen": imgUrl,
          "quantity": 1,
        });
      }
    });
  }

  void _showSnackbar(BuildContext context, String nombre) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Se agrego $nombre al carrito',
          style: TextStyle(color: Colors.white),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: amarillo,
        duration: Duration(seconds: 2),
        width: 200,
      ),
    );
  }

  void addToFavorites(Product product) {
    final productRef =
        _databaseRef.child("favorites").child(user!.uid).child(product.name);

    productRef.set({
      DatabaseFields.nombre: product.name,
      DatabaseFields.precio: product.price,
      DatabaseFields.imagen: product.img,
    });
  }
}

class Product {
  final String name;
  final double price;
  final String img;

  Product({required this.name, required this.price, required this.img});
}

class DatabaseFields {
  static const String nombre = "nombre";
  static const String precio = "precio";
  static const String imagen = "imagen";
}

const Color amarillo = Colors.yellow;
