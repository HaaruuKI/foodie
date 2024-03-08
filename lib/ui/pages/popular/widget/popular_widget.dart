import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

class PopularesItem extends StatelessWidget {
  final String name;
  final double price;
  final String img;
  // final VoidCallback onTap;

  const PopularesItem({
    required this.name,
    required this.price,
    required this.img,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
      child: GestureDetector(
        // onTap: onTap,
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
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: img,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(height: 12),
                Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "\$ $price",
                  style: TextStyle(
                    fontSize: 17,
                    color: amarillo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border,
                          color: amarillo, size: 26),
                      onPressed: () {
                        // addToFavorites(product);
                      },
                    ),
                    IconButton(
                      icon:
                          Icon(CupertinoIcons.cart, color: amarillo, size: 26),
                      onPressed: () {
                        // _showSnackbar(context, nombre);
                        // enviarDatosRealtimeDatabase(nombre, precio, imagenUrl);
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
