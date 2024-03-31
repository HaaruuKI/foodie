// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/categories/category_list.dart';
import 'package:foodie/domain/entities/categories/send_categorie.dart';

Widget CategoryListWidget(BuildContext context) {
  return Row(
    children: CategoryList.categories
        .map((category) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () =>
                    BtnCategorie.NavigateToMenuPage(context, category.category),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    category.imagePath,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ))
        .toList(),
  );
}
