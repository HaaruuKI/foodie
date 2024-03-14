import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/services/firebase_options.dart';
import 'package:foodie/ui/colors.dart';
import 'package:foodie/ui/router.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: const FirebaseOptions(
//         apiKey: "AIzaSyDPV7z-rpBw5IkRBUgnJdJFWykRKCtsdQA",
//         authDomain: "foodie-960f5.firebaseapp.com",
//         databaseURL: "https://foodie-960f5-default-rtdb.firebaseio.com",
//         projectId: "foodie-960f5",
//         storageBucket: "foodie-960f5.appspot.com",
//         messagingSenderId: "888038063008",
//         appId: "1:888038063008:web:27631104756a011800c2c5"),
//   );
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  // print('Platform: ${DefaultFirebaseOptions.currentPlatform}');
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
