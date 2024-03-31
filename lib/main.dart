import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/services/firebase_options.dart';
import 'package:foodie/ui/colors.dart';
import 'package:foodie/ui/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
