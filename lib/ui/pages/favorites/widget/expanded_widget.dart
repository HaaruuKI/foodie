import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

Widget ExpandedWidget(String name, int price) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            "\$${price.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 20,
              color: amarillo,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
