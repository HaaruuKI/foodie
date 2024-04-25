// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class textfieldNumPhone extends StatelessWidget {
  const textfieldNumPhone({
    super.key,
    required this.numphoneController,
    required this.numphone,
  });

  final TextEditingController numphoneController;
  final String? numphone;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      controller: numphoneController,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        hintText: numphone,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
