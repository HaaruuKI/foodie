import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodie/ui/colors.dart';

class MenuSnackWidget extends StatelessWidget {
  const MenuSnackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('products')
              .where('category', isEqualTo: 'snack')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final products = snapshot.data?.docs;

            return ListView.builder(
              itemCount: products?.length,
              itemBuilder: (context, index) {
                final product = products?[index];

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: maxWidth,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, 'itemPage');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: CachedNetworkImage(
                              imageUrl: product?['img_url'],
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            height: 120,
                            width: 120,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  product?['name'],
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                RatingBar.builder(
                                  initialRating: 5,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemSize: 18,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4),
                                  itemBuilder: (context, _) =>
                                      Icon(Icons.star, color: amarillo),
                                  onRatingUpdate: (index) {},
                                ),
                                Text(
                                  "\$${product?['price']}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: amarillo,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  // addToFavorites(product);
                                },
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: amarillo,
                                  size: 26,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // _showSnackbar(context, product['nombre']);
                                  // enviarDatosRealtimeDatabase(product['nombre'], product['precio'], product['imagenUrl']);
                                },
                                icon: Icon(
                                  CupertinoIcons.cart,
                                  color: amarillo,
                                  size: 26,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
