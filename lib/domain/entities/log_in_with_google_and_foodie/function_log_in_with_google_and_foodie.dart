import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/domain/services/auth_google.dart';

class FunctionLogInWithGoogleAndFoodie {
  static Future<void> logInWithGoogle(context) async {
    User? user = await Authenticator.iniciarSesion(context);

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
  }
}
