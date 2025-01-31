// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';
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
    return Column(
      children: [
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

            if (user != null) {
              DocumentSnapshot snapshot = await FirebaseFirestore.instance
                  .collection('Users')
                  .doc(LogIn.auth.currentUser?.uid)
                  .get();
              if (snapshot.exists) {
                print('User exists in the collection');
                Navigator.pushNamed(context, 'menu');
              } else {
                print('User does not exist in the collection');
                Navigator.pushNamed(context, 'registerGoogle');
              }
            }
          },
          icon: Image.asset('assets/google512px.png', scale: 25),
          label: const Text('Entrar con Google.'),
        ),
      ],
    );
  }
}
