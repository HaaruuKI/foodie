// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/popular.dart';
import 'package:foodie/ui/pages/more/widget/more_wiget.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  Future<List<MoreWidget>> _getNewetsItems() async {
    ProductService productService = ProductService();
    List<Product> products =
        await productService.getProducts(limit: 10, ordeBy: 'name');

    return products.map((product) {
      final name = product.name;
      final price = product.price;
      final img = product.img;

      return MoreWidget(
        name: name,
        price: price,
        img: img,
        onTap: () {
          Navigator.pushNamed(context, 'details', arguments: {
            'name': name,
            'price': price,
            'img': img,
            'des': product.descripcion,
          });
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getNewetsItems(),
      builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Column(
            children: snapshot.data!,
          );
        }
      },
    );
  }
}
