import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

Widget textBienvenida() {
  return const Column(
    children: [
      Text(
        'Bienvenidos',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 50.0),
      ),
      Text(
        'Iniciar Sesión',
        style:
            TextStyle(color: gris, fontWeight: FontWeight.w700, fontSize: 30.0),
      ),
    ],
  );
}
