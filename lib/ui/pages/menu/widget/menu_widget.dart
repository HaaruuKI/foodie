import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:foodie/domain/entities/add_to_favorites.dart';
import 'package:foodie/domain/entities/log_in.dart';
// import 'package:foodie/domain/entities/snack_bar_favorites.dart';
import 'package:foodie/ui/colors.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  String category = 'comida';

  @override
  void initState() {
    super.initState();
    LogIn().GetCurrentUser(); // Call GetCurrentUser with context
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    category = args['category'];
    print('category: $category');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('products')
              .where('category', isEqualTo: category)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final products = snapshot.data?.docs;

            return ListView.builder(
              itemCount: products?.length,
              itemBuilder: (context, index) {
                final product = products?[index];
                // final String? name = product?['name'];
                // final String? price = product?['price'];
                // final String? img = product?['img_url'];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
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
                          offset: const Offset(0, 3),
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
                            height: 120,
                            width: 120,
                            child: CachedNetworkImage(
                              imageUrl: product?['img_url'],
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
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
                                  product?['name'],
                                  style: const TextStyle(
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
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  itemBuilder: (context, _) =>
                                      const Icon(Icons.star, color: amarillo),
                                  onRatingUpdate: (index) {},
                                ),
                                Text(
                                  "\$${product?['price']}",
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  print('usuario: ${LogIn.user}');
                                  // if (LogIn.user != null) {
                                  //   AgregarFavoritos.AddToFavorite(
                                  //       product?['name'],
                                  //       product?['price'],
                                  //       product?['img_url']);
                                  //   ShowSnackBarsFavorites
                                  //       .ShowSnackBarsFavorite(
                                  //           context, product?['name']);
                                  //   print('usuario registrado');
                                  // } else {
                                  //   print('usuario no registrado');
                                  // }
                                },
                                icon: const Icon(
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
                                icon: const Icon(
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
