import 'package:flutter/material.dart';
import 'package:foodie/ui/widget/name_widget.dart';
import 'package:foodie/ui/widget/price_widget.dart';
import 'package:foodie/ui/widget/rating_bar_widget.dart';

Widget expandedContaierMoreProduct(String name, int price) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          nameWidget(name),
          ratingBarWidget(),
          priceWidget(price),
        ],
      ),
    ),
  );
}
