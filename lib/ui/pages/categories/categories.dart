import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final List<CategoryItem> categories = [
    CategoryItem(
      imagePath: 'assets/comidas.png',
      routeName: 'menu_page',
      id: 1,
    ),
    CategoryItem(
      imagePath: 'assets/bebidas.png',
      routeName: 'menuBebida',
      id: 2,
    ),
    CategoryItem(
      imagePath: 'assets/snacks.png',
      routeName: 'SnacksGuest',
      id: 3,
    ),
    CategoryItem(
      imagePath: 'assets/temporada.png',
      routeName: 'TemporadaGuest',
      id: 4,
    ),
  ];

  Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Column(
          children: [
            const Text(
              'Categorias',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 26),
            Row(
              children: categories
                  .map((category) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, category.routeName,
                                arguments: category.id);
                          },
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
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem {
  final String imagePath;
  final String routeName;
  final int id;

  CategoryItem({
    required this.id,
    required this.imagePath,
    required this.routeName,
  });
}
