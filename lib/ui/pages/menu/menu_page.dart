// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/menu/widget/expanded_container.dart';
import 'package:foodie/ui/pages/menu/widget/text_category.dart';
import 'package:foodie/ui/widget/button_back.dart';
import 'package:foodie/ui/widget/button_navigate_shopping_cart.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String? category;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    category = args?['category'] ?? 'No hay producto';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const buttonBack(),
          textCategory(category),
          expandedContainer(category),
        ],
      ),
      floatingActionButton: const ButtonNavigateShoppingCart(),
    );
  }
}
