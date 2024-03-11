import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

class PopularesItem extends StatefulWidget {
  final String name;
  final double price;
  final String img;
  final VoidCallback onTap;

  const PopularesItem({
    super.key,
    required this.name,
    required this.price,
    required this.img,
    required this.onTap,
  });

  @override
  State<PopularesItem> createState() => _PopularesItemState();
}

class _PopularesItemState extends State<PopularesItem> {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final FirebaseDatabase database = FirebaseDatabase.instance;
  static const String nombre = "name";
  static const String precio = "price";
  static const String imagen = "img_url";

  final DatabaseReference _databaseRef = database.ref();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  String? userEmail;
  String? userName;

  @override
  void initState() {
    super.initState();
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
      setState(() {
        userName = userData.get('name');
        userEmail = userData.get('email');
      });
    }
  }

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

  void addToFavorites(String name, double price, String imgUrl) {
    final productRef =
        _databaseRef.child("favorites").child(user!.uid).child(name);

    productRef.set({
      nombre: widget.name,
      precio: widget.price,
      imagen: widget.img,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 170,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.img,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "\$ ${widget.price}",
                  style: const TextStyle(
                    fontSize: 17,
                    color: amarillo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border,
                          color: amarillo, size: 26),
                      onPressed: () {
                        if (user != null) {
                          addToFavorites(widget.name, widget.price, widget.img);
                          print('usuario registrado');
                        } else {
                          print('usuario no registrado');
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(CupertinoIcons.cart,
                          color: amarillo, size: 26),
                      onPressed: () {
                        if (user != null) {
                          _showSnackbar(context, widget.name);
                          enviarDatosRealtimeDatabase(
                              widget.name, widget.price, widget.img);
                          print('usuario registrado');
                        } else {
                          print('usuario no registrado');
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
