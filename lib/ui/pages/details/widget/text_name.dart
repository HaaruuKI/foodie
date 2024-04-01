import 'package:flutter/material.dart';

Widget TextName(String? name) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 10,
      bottom: 20,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name ?? '',
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
