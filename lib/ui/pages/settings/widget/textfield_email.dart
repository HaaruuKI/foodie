// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class textfieldEmail extends StatelessWidget {
  const textfieldEmail({
    super.key,
    required this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      enabled: false,
      controller: TextEditingController(text: email),
      decoration: InputDecoration(
        hintText: email,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
