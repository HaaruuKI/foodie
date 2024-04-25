// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class textfieldName extends StatelessWidget {
  const textfieldName({
    super.key,
    required this.nameController,
    required this.name,
  });

  final TextEditingController nameController;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      controller: nameController,
      decoration: InputDecoration(
        hintText: name,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
