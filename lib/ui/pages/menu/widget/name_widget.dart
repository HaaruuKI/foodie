import 'package:flutter/material.dart';

Widget nameWidget(String? name) {
  return Text(
    name ?? 'Error al cargar el nombre',
    style: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  );
}
