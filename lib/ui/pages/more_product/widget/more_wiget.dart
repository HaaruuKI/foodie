// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/ui/pages/more_product/widget/button_favorite_and_shopping_cart.dart';
import 'package:foodie/ui/pages/more_product/widget/expanded_container.dart';
import 'package:foodie/ui/widget/image_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    // final sendDetails = widget.onTap;
    final String name = widget.name;
    final int price = widget.price;
    final String img = widget.img;
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
            imageWidget(img),
            expandedContaierMoreProduct(name, price),
            buttonFavoriteAndShoppingCart(widget: widget)
          ],
        ),
      ),
    );
  }
}
