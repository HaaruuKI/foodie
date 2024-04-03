import 'package:flutter/material.dart';

Widget passwordInput(TextEditingController _passwordController) {
  return Container(
    margin: const EdgeInsets.only(top: 15.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
          hintText: 'Contraseña',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
      validator: (value) {
        if (value!.isEmpty) {
          return 'La contraseña no puede estar vacía';
        }
        return null;
      },
    ),
  );
}
