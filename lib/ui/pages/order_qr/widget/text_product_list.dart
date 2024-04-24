// ignore_for_file: file_names, use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, library_private_types_in_public_api, unnecessary_import

import 'package:flutter/cupertino.dart';

class textProductList extends StatelessWidget {
  const textProductList({
    super.key,
    required this.products,
  });

  final List products;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Agregado
        children: products
            .map<Widget>(
              (product) => Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Agregado
                  children: [
                    Text(
                      '${product['name']} - ${product['quantity']} C/unidad - ${product['price'].toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 16),
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
