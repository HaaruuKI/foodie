import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/menu/widget/name_widget.dart';
import 'package:foodie/ui/pages/menu/widget/price_widget.dart';
import 'package:foodie/ui/pages/menu/widget/raiting_bar_widget.dart';

Widget widgetContainerNameAndPrice(String name, int price) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          nameWidget(name),
          raitingBarWidget(),
          priceWidget(price),
        ],
      ),
    ),
  );
}
