import 'package:flutter/material.dart';

class textProductList extends StatelessWidget {
  const textProductList({
    super.key,
    required this.products,
  });

  final products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: products
            .map<Widget>(
              (product) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Text(
                      '${product['name']} - ${product['quantity']} C/unidad - ${product['price'].toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
