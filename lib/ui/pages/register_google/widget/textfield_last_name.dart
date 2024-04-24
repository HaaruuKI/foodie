import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

Widget lastName(
    BuildContext context, TextEditingController apellidoController) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    decoration: BoxDecoration(
        color: bgEntradas, borderRadius: BorderRadius.circular(40.0)),
    child: TextFormField(
      controller: apellidoController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          hintText: "Apellido",
          border: OutlineInputBorder(borderSide: BorderSide.none)),
      validator: (value) {
        if (value!.isEmpty) {
          return 'El apellido no puede estar vacío';
        }
        return null;
      },
    ),
  );
}
