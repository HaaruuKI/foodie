import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';
import 'package:foodie/ui/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: 'bienvenida',
      theme: ThemeData(
        primaryColor: amarillo,
        disabledColor: gris,
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        colorScheme: const ColorScheme.light().copyWith(
          secondary: const Color.fromARGB(255, 243, 164, 16),
        ),
      ),
    );
  }
}
