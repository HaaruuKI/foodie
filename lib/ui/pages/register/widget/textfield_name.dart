// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

class textfieldName extends StatelessWidget {
  final TextEditingController nameController;

  const textfieldName({
    super.key,
    required this.nameController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        margin: const EdgeInsets.only(top: 40.0),
        decoration: BoxDecoration(
            color: bgEntradas, borderRadius: BorderRadius.circular(40.0)),
        child: TextFormField(
          controller: nameController,
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
      ),
    );
  }
}
