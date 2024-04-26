// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types

import 'package:flutter/material.dart';

class imageWidget extends StatelessWidget {
  const imageWidget({
    super.key,
    required this.img,
  });
  final img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Image.network(
        img ?? '',
        height: 300,
      ),
    );
  }
}
