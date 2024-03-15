import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LogIn {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final FirebaseDatabase database = FirebaseDatabase.instance;

  static final DatabaseReference databaseRef = database.ref();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static User? user;
  String? userEmail;
  String? userName;

  Future<void> GetCurrentUser(BuildContext context) async {
    user = _auth.currentUser;
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
    }
  }
}
