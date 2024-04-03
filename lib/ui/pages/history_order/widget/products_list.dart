import 'package:flutter/material.dart';

Widget productList(List products_order) {
  return Column(
    children: products_order
        .map<Widget>(
          (product) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Text(
                  '${product['name']} - ${product['quantity']} unidades - ${product['price'].toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        )
        .toList(),
  );
}
