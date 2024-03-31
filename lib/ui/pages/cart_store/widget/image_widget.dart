import 'package:flutter/material.dart';

Widget ImageWidget(img_prduct) {
  return Container(
    alignment: Alignment.center,
    child: Image.network(
      img_prduct,
      width: 130,
      height: 80,
    ),
  );
}
