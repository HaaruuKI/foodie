// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/details/funtion_details.dart';
import 'package:foodie/domain/entities/products/products.dart';
import 'package:foodie/ui/pages/more_product/widget/more_wiget.dart';

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
      final description = product.descripcion;

      return MoreWidget(
        name: name,
        price: price,
        img: img,
        onTap: () {
          FuntionDetails.NavegeteDetails(
              context, name, price, img, description);
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 10),
          child: Text(
            "Mas Productos",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        FutureBuilder(
          future: _getNewetsItems(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
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
        ),
      ],
    );
  }
}
