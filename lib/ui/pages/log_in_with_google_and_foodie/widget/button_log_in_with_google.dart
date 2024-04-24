// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in_with_google_and_foodie/function_log_in_with_google_and_foodie.dart';
import 'package:foodie/ui/button.dart';

class buttonLogInWithGoogle extends StatelessWidget {
  const buttonLogInWithGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton.icon(
        style: buttonSecondary,
        onPressed: () {
          FunctionLogInWithGoogleAndFoodie.logInWithGoogle(context);
        },
        icon: Image.asset('assets/google512px.png', scale: 25),
        label: const Text('Entrar con Google.'),
      ),
    );
  }
}
