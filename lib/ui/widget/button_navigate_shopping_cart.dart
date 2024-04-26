import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

class ButtonNavigateShoppingCart extends StatefulWidget {
  const ButtonNavigateShoppingCart({super.key});

  @override
  State<ButtonNavigateShoppingCart> createState() =>
      _ButtonNavigateShoppingCartState();
}

class _ButtonNavigateShoppingCartState
    extends State<ButtonNavigateShoppingCart> {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  String? userEmail;
  String? userName;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
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
      setState(() {
        userName = userData.get('name');
        userEmail = userData.get('email');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (user != null) {
          Navigator.pushNamed(context, 'cartPage');
        } else {
          Navigator.pushNamed(context, 'profile');
        }
      },
      backgroundColor: Colors.white,
      child: const Icon(
        CupertinoIcons.cart,
        size: 28,
        color: amarillo,
      ),
    );
  }
}
