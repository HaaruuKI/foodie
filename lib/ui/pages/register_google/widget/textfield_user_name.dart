import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

Widget userName(BuildContext context, TextEditingController nombreController) {
  return Container(
    margin: const EdgeInsets.only(top: 40.0),
    decoration: BoxDecoration(
        color: bgEntradas, borderRadius: BorderRadius.circular(40.0)),
    child: TextFormField(
      controller: nombreController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          hintText: "Nombre",
          border: OutlineInputBorder(borderSide: BorderSide.none)),
      validator: (value) {
        if (value!.isEmpty) {
          return 'El nombre no puede estar vacío';
        }
        return null;
      },
    ),
  );
}
