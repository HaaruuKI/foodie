// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  User? user;
  String userEmail = "";
  String userName = "";

  get buttonTertiary => null;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    user = _auth.currentUser;
    if (user != null) {
      if (user!.providerData
          .any((provider) => provider.providerId == 'google.com')) {
        _getGoogleUserData();
      } else {
        _getEmailPasswordUserData();
      }
    }
  }

  Future<void> _getGoogleUserData() async {
    userName = user!.displayName ?? "";
    userEmail = user!.email ?? "";
  }

  Future<void> _getEmailPasswordUserData() async {
    final userData = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .get();
    if (userData.exists) {
      setState(() {
        userName = userData.get('name');
        userEmail = userData.get('email');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (user != null)
        Column(
          children: [
            Text(userName, style: const TextStyle(fontSize: 24)),
            Text(userEmail, style: const TextStyle(fontSize: 18)),
          ],
        ),
      // TextButton(
      //   onPressed: () {},
      //   child: const Text(
      //     'Configuraciones',
      //     style: TextStyle(fontSize: 20, color: Colors.black),
      //   ),
      // ),
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
            await _auth.signOut();
            await _googleSignIn.signOut();
            Navigator.pushNamed(context, 'menu');
          },
          child: const Text("Cerrar sesion"),
        ),
      ),
    ]);
  }
}
