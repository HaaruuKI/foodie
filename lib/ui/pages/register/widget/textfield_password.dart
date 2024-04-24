// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

class textfieldPassword extends StatelessWidget {
  final TextEditingController passwordController;
  const textfieldPassword({
    super.key,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
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
      ),
    );
  }
}
