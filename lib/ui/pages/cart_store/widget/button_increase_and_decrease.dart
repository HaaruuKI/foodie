import 'package:flutter/material.dart';
import 'package:foodie/ui/widget/button_decrease_widget.dart';
import 'package:foodie/ui/widget/button_increase_widget.dart';
import 'package:foodie/ui/widget/quantity_widget.dart';

Widget buttomIncrementAndDecrement(Map<String, dynamic> item, List items,
    int totalQuantity, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      buttonIncreaseWidget(item, items),
      quantityWidget(item),
      buttonDecreaseWidget(item, items, totalQuantity, context),
    ],
  );
}
