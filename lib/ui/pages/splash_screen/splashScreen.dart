import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/splash_screen/widget/splashScreenFuncion.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Llama a la función desde splashScreenFuncion.dart
    return SplashScreenFunction();
  }
}
