import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/menu/funtion_menu.dart';
import 'package:foodie/ui/pages/menu/widget/add_favorite_and_shopping_cart.dart';
import 'package:foodie/ui/pages/menu/widget/image.dart';
import 'package:foodie/ui/pages/menu/widget/widget_container_name_and_price.dart';

Widget expandedContainer(String? category) {
  return Expanded(
    child: LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        return StreamBuilder<QuerySnapshot>(
          stream: FuntionGetMenu.GetMenuData(category!),
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
                final String name = product?['name'];
                final int price = product?['price'];
                final String img = product?['img_url'];
                final String des = product?['description'];
                // final String status = product?['status'];

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
                        image(context, name, price, img, des),
                        widgetContainerNameAndPrice(name, price),
                        addFavoriteAndShoppingCart(context, name, price, img),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    ),
  );
}
