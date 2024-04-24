// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously, camel_case_types

import 'package:flutter/material.dart';

class textfieldEmail extends StatelessWidget {
  final TextEditingController emailController;
  const textfieldEmail({
    super.key,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40.0),
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(142, 142, 147, 1.2),
          borderRadius: BorderRadius.circular(30.0)),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: 'Email',
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
}
