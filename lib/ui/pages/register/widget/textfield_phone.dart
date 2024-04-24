// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

class textfieldPhone extends StatelessWidget {
  final TextEditingController phoneController;
  const textfieldPhone({
    super.key,
    required this.phoneController,
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
          controller: phoneController,
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
      ),
    );
  }
}
