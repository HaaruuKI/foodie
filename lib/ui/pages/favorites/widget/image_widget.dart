import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget ImageWidget(String img) {
  return Container(
    alignment: Alignment.center,
    height: 100,
    width: 130,
    child: CachedNetworkImage(
      imageUrl: img,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    ),
  );
}
