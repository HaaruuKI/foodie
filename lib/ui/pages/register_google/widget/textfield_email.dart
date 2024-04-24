import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

Widget emailTextfield(
    BuildContext context, TextEditingController emailController) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    decoration: BoxDecoration(
        color: bgEntradas, borderRadius: BorderRadius.circular(40.0)),
    child: TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          hintText: "Correo electrónico",
          border: OutlineInputBorder(borderSide: BorderSide.none)),
      validator: (value) {
        if (value!.isEmpty) {
          return 'El email no puede estar vacío';
        }
        return null;
      },
    ),
  );
}
