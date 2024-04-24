// TODO Implement this library.// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/ui/button.dart';

class buttonSignOut extends StatelessWidget {
  const buttonSignOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        style: buttonTertiary,
        onPressed: () async {
          await LogIn.auth.signOut();
          await LogIn.googleSignIn.signOut();
          Navigator.pushNamed(context, 'menu');
        },
        child: const Text("Cerrar sesion"),
      ),
    );
  }
}
