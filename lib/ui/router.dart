import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/menu/menu_comidas.dart';
import 'package:foodie/ui/pages/splash_screen/splashScreen.dart';

/// Rutas de la aplicación
final routes = <String, WidgetBuilder>{
  // Splash
  'bienvenida': (BuildContext context) => const SplashScreen(),

  // Menu
  'menuComida': (BuildContext context) => MenuComida(),
};
