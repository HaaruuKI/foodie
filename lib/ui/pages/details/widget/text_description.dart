import 'package:flutter/material.dart';

Widget TextDescription(String? des) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      des ?? '',
      style: const TextStyle(
        fontSize: 16,
      ),
      textAlign: TextAlign.justify,
    ),
  );
}
