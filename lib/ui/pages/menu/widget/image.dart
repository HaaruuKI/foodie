import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget image(
    BuildContext context, String name, int price, String img, String des) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, 'details', arguments: {
        'name': name,
        'price': price,
        'img': img,
        'des': des,
      });
    },
    child: Container(
      alignment: Alignment.center,
      height: 120,
      width: 120,
      child: CachedNetworkImage(
        imageUrl: img,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    ),
  );
}
