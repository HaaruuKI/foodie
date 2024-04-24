import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

Widget passwordTextfield(
    BuildContext context, TextEditingController passwordController) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    decoration: BoxDecoration(
        color: bgEntradas, borderRadius: BorderRadius.circular(40.0)),
    child: TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: const InputDecoration(
          hintText: "Contraseña",
          border: OutlineInputBorder(borderSide: BorderSide.none)),
      validator: (value) {
        if (value!.isEmpty) {
          return 'La contraseña no puede estar vacío';
        }
        return null;
      },
    ),
  );
}
