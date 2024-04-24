// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie/ui/button.dart';

class buttonNavigateLogin extends StatelessWidget {
  const buttonNavigateLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: buttonPrimary,
        onPressed: () {
          Navigator.pushNamed(context, 'login');
        },
        child: const Text('Entrar'),
      ),
    );
  }
}
