// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

class textfieldEmail extends StatelessWidget {
  final TextEditingController emailController;
  const textfieldEmail({
    super.key,
    required this.emailController,
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
      ),
    );
  }
}
