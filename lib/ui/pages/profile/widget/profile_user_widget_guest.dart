// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/services/auth_google.dart';
import 'package:foodie/ui/button.dart';

class ProfileUserGuest extends StatefulWidget {
  const ProfileUserGuest({super.key});

  @override
  State<ProfileUserGuest> createState() => _ProfileUserGuestState();
}

class _ProfileUserGuestState extends State<ProfileUserGuest> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        style: buttonPrimary,
        onPressed: () {
          Navigator.pushNamed(context, 'login');
        },
        child: const Text('Entrar'),
      ),
      const SizedBox(height: 20),
      ElevatedButton.icon(
        style: buttonSecondary,
        onPressed: () async {
          User? user = await Authenticator.iniciarSesion(context);
          print(user?.displayName);
          print(user?.uid);
          if (user != null) {
            Navigator.pushNamed(context, 'menu');
          }
        },
        icon: Image.asset('assets/google512px.png', scale: 25),
        label: const Text('Entrar con Google.'),
      ),
    ]);
  }
}
