// ignore_for_file: library_private_types_in_public_api

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/tabs/tabs_page.dart';

class WidgetSplashScreen extends StatefulWidget {
  const WidgetSplashScreen({super.key});

  @override
  _WidgetSplashScreenState createState() => _WidgetSplashScreenState();
}

class _WidgetSplashScreenState extends State<WidgetSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TabsPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Aquí puedes personalizar el diseño de tu splash screen
      body: Stack(
        children: [
          //Es el estilo del container del background
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/WelcomeBG.jpeg'),
            )),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Image.asset('assets/my-Logo.png'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
