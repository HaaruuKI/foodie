// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class buttonBack extends StatelessWidget {
  const buttonBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 50.0,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
