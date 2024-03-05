import 'package:flutter/material.dart';

class SplashScreenFunction extends StatefulWidget {
  @override
  _SplashScreenFunctionState createState() => _SplashScreenFunctionState();
}

class _SplashScreenFunctionState extends State<SplashScreenFunction> {
  @override
  void initState() {
    super.initState();
    // Aquí puedes agregar cualquier lógica que necesites para tu splash screen, como cargar datos o mostrar una animación
    // Por ejemplo, puedes usar un Future.delayed para simular una espera de 3 segundos antes de pasar a la siguiente pantalla
    Future.delayed(const Duration(seconds: 4), () {
      // Navegar a la siguiente pantalla después de 3 segundos
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NextScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // Aquí puedes personalizar el diseño de tu splash screen
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // Aquí puedes personalizar el diseño de la siguiente pantalla
      body: Center(
        child: Text('Next Screen'),
      ),
    );
  }
}
