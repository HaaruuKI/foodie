import 'package:flutter/material.dart';

Widget textCategory(String? category) {
  return Text(
    category!.toUpperCase(),
    style: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );
}
