// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class buttonNavigateLogin extends StatelessWidget {
  const buttonNavigateLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_rounded,
        color: Colors.black,
        size: 50.0,
      ),
      onPressed: () {
        Navigator.pushNamed(context, 'login');
      },
    );
  }
}
