// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/ui/button.dart';
// import 'package:foodie/ui/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    LogIn().GetCurrentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (LogIn.user != null)
        Column(
          children: [
            Text(
              LogIn.userName!,
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              LogIn.userEmail!,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      const SizedBox(height: 30),
      // const Text(
      //   'Creditos foodie:',
      //   style: TextStyle(
      //       fontSize: 25.0, fontWeight: FontWeight.bold, color: amarillo),
      // ),
      // Text(
      //   '${credits!.toStringAsFixed(2)}',
      //   style: const TextStyle(
      //       fontSize: 25.0, fontWeight: FontWeight.bold, color: amarillo),
      // ),
      const SizedBox(height: 30),
      TextButton(
        onPressed: () => Navigator.pushNamed(context, 'settings'),
        child: const Text(
          'Configuraciones',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      const SizedBox(height: 20),
      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, 'history');
        },
        child: const Text(
          'Historial de ordenes',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      const SizedBox(height: 30),
      Align(
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
      ),
    ]);
  }
}
