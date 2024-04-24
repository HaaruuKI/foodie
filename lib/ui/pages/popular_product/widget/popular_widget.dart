import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/ui/pages/popular_product/widget/button_add_favorite.dart';
import 'package:foodie/ui/pages/popular_product/widget/button_send_data_to_shopping_cart.dart';
import 'package:foodie/ui/widget/image_widget.dart';
import 'package:foodie/ui/widget/name_widget.dart';
import 'package:foodie/ui/widget/price_widget.dart';

class PopularesItem extends StatefulWidget {
  final String name;
  final int price;
  final String img;
  final VoidCallback onTap;

  const PopularesItem({
    super.key,
    required this.name,
    required this.price,
    required this.img,
    required this.onTap,
  });

  @override
  State<PopularesItem> createState() => _PopularesItemState();
}

class _PopularesItemState extends State<PopularesItem> {
  @override
  void initState() {
    super.initState();
    LogIn().GetCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.name;
    final img = widget.img;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
      child: GestureDetector(
        onTap: widget.onTap,
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
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageWidget(img),
                nameWidget(name),
                priceWidget(widget.price),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonAddFavorite(widget: widget),
                    buttonSendDataToShoppingCart(widget: widget),
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
