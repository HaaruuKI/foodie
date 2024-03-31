import 'package:flutter/material.dart';

Widget ImageWidget(String? img) {
  return Padding(
    padding: EdgeInsets.all(16),
    child: Image.network(
      img ?? '',
      height: 300,
    ),
  );
}
