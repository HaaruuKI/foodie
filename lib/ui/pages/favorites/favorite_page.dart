// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/favorite/name_favorite.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/ui/pages/cart_store/widget/image_widget.dart';
import 'package:foodie/ui/pages/favorites/widget/buttom_add_and_favorite.dart';
import 'package:foodie/ui/pages/favorites/widget/expanded_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: LogIn.databaseRef
            .child(GetNameFavorite.get_key_favorite)
            .child(LogIn.user!.uid)
            .onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data =
                snapshot.data!.snapshot.value as Map<dynamic, dynamic>?;
            if (data != null) {
              final List<Map<String, dynamic>> items = [];
              data.forEach((key, value) {
                final product = Map<String, dynamic>.from(value as dynamic);
                items.add({
                  'key': key,
                  'name': product[GetNameFavorite.get_name_product],
                  'price': product[GetNameFavorite.get_price_product],
                  'img': product[GetNameFavorite.get_image_product],
                });
              });
              return Column(
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.only(top: 0, left: 5, bottom: 5),
                    child: Text(
                      'Favoritos',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final String img = item['img'];
                        final String name = item['name'];
                        final int price = item['price'];

                        return ListTile(
                          title: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  width: double.infinity,
                                  height: 120,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ImageWidget(img),
                                      ExpandedWidget(name, price),
                                      ButtomAddAndFavorite(
                                          name, price, img, context, item),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
