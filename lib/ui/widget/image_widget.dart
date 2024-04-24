import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/name_shopping_cart.dart';

Widget imageWidget(String? img) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      alignment: Alignment.center,
      height: 120,
      width: 130,
      child: CachedNetworkImage(
        imageUrl: img ?? GetNameShoppingCart.url,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    ),
  );
}
