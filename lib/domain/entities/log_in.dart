// ignore_for_file: unused_field, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogIn {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final FirebaseDatabase database = FirebaseDatabase.instance;

  static final DatabaseReference databaseRef = database.ref();
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();

  static User? user;
  static String? userEmail;
  static String? userName;
  static String? userLastName;
  static String? userNumPhone;

  Future<void> GetCurrentUser(BuildContext context) async {
    user = auth.currentUser;
    if (user != null) {
      await _getUserData();
    }
  }

  Future<void> _getUserData() async {
    if (user!.providerData
        .any((provider) => provider.providerId == 'google.com')) {
      _getGoogleUserData();
    } else {
      _getEmailPasswordUserData();
    }
  }

  Future<void> _getGoogleUserData() async {
    userName = user!.displayName ?? "";
    userEmail = user!.email ?? "";
  }

  Future<void> _getEmailPasswordUserData() async {
    final userData = await firestore.collection('Users').doc(user!.uid).get();
    if (userData.exists) {
      userName = userData.get('name');
      userEmail = userData.get('email');
      userLastName = userData.get('lastname');
      userNumPhone = userData.get('numero');
    }
  }
}
