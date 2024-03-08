// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/popular.dart';
import 'package:foodie/ui/pages/popular/widget/popular_widget.dart';

class PopularesItemWidget extends StatefulWidget {
  const PopularesItemWidget({Key? key});

  @override
  _PopularesItemWidgetState createState() => _PopularesItemWidgetState();
}

class _PopularesItemWidgetState extends State<PopularesItemWidget> {
  Future<List<PopularesItem>> _getPopularItems() async {
    ProductService productService = ProductService();
    List<Product> products =
        await productService.getProducts(limit: 6, ordeBy: 'price');

    return products.map((product) {
      final name = product.name;
      final price = product.price;
      final img = product.img;

      return PopularesItem(
        name: name,
        price: price,
        img: img,
        // onTap: () {
        //   Navigator.pushNamed(context, 'itemPage', arguments: {
        //     'name': name,
        //     'price': price,
        //     'img': img,
        //     'des': product.descripcion,
        //   });
        // },
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
            "Populares",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        FutureBuilder<List<PopularesItem>>(
          future: _getPopularItems(),
          builder: (BuildContext context,
              AsyncSnapshot<List<PopularesItem>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return SizedBox(
                height: 330,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return snapshot.data![index];
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
