// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

class textfieldLastName extends StatelessWidget {
  final TextEditingController lastNameController;
  const textfieldLastName({
    super.key,
    required this.lastNameController,
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
          controller: lastNameController,
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
      ),
    );
  }
}
