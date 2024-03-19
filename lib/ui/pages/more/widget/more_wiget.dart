// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/ui/colors.dart';

class MoreWidget extends StatefulWidget {
  final String name;
  final int price;
  final String img;
  final VoidCallback onTap;

  const MoreWidget({
    super.key,
    required this.name,
    required this.price,
    required this.img,
    required this.onTap,
  });

  @override
  _MoreWidgetState createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {
  @override
  void initState() {
    super.initState();
    LogIn().GetCurrentUser;
  }

  void enviarDatosRealtimeDatabase(String name, int price, String imgUrl) {
    final userRef = LogIn.databaseRef.child("carts").child(LogIn.user!.uid);
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
          style: const TextStyle(color: Colors.white),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: amarillo,
        duration: const Duration(seconds: 2),
        width: 200,
      ),
    );
  }

  void addToFavorites(String name, int price, String imgUrl) {
    final productRef =
        LogIn.databaseRef.child("favorites").child(LogIn.user!.uid).child(name);

    productRef.set({
      'name': widget.name,
      'price': widget.price,
      'img_url': widget.img,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        height: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: widget.onTap,
              child: Container(
                alignment: Alignment.center,
                height: 120,
                width: 130,
                child: CachedNetworkImage(
                  imageUrl: widget.img,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    RatingBar.builder(
                      initialRating: 4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: 18,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                      itemBuilder: (context, _) =>
                          const Icon(Icons.star, color: amarillo),
                      onRatingUpdate: (index) {},
                    ),
                    Text(
                      "\$ ${widget.price}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: amarillo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    if (LogIn.user != null) {
                      addToFavorites(widget.name, widget.price, widget.img);
                      print('usuario registrado');
                    } else {
                      print('usuario no registrado');
                    }
                  },
                  icon: const Icon(
                    Icons.favorite_border,
                    color: amarillo,
                    size: 26,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (LogIn.user != null) {
                      _showSnackbar(context, widget.name);
                      enviarDatosRealtimeDatabase(
                          widget.name, widget.price, widget.img);
                      print('usuario registrado');
                    } else {
                      print('usuario no registrado');
                    }
                  },
                  icon: const Icon(
                    CupertinoIcons.cart,
                    color: amarillo,
                    size: 26,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}