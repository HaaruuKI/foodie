import 'package:flutter/material.dart';

Widget quantityWidget(Map<String, dynamic> item) {
  return Text(
    '${item['quantity'] ?? 0}',
    style: const TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
  );
}
