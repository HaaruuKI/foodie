// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class textfieldLastName extends StatelessWidget {
  const textfieldLastName({
    super.key,
    required this.lastnameController,
    required this.lastname,
  });

  final TextEditingController lastnameController;
  final String? lastname;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      controller: lastnameController,
      decoration: InputDecoration(
        hintText: lastname,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
