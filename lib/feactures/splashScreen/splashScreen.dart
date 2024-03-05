import 'package:flutter/material.dart';
import 'package:foodie/data/models/splashScreenFuncion/splashScreenFuncion.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Llama a la función desde splashScreenFuncion.dart
    return SplashScreenFunction();
  }
}
