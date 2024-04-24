import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

Widget phoneTextfield(
    BuildContext context, TextEditingController numeroController) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    decoration: BoxDecoration(
        color: bgEntradas, borderRadius: BorderRadius.circular(40.0)),
    child: TextFormField(
      controller: numeroController,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
          hintText: "Número de teléfono",
          border: OutlineInputBorder(borderSide: BorderSide.none)),
      validator: (value) {
        if (value!.isEmpty) {
          return 'El numero de telefono no puede estar vacío';
        }
        return null;
      },
    ),
  );
}
