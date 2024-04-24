import 'package:flutter/material.dart';

Widget nameWidget(String? name) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Text(
      name ?? 'Error al cargar el nombre',
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
