import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/cart_store/CartPage.dart';
import 'package:foodie/ui/pages/login/login_page.dart';
import 'package:foodie/ui/pages/menu/menu_comidas.dart';
import 'package:foodie/ui/pages/register/sing_up.dart';
import 'package:foodie/ui/pages/splash_screen/splashScreen.dart';
import 'package:foodie/ui/pages/tabs/tabs_page.dart';

/// Rutas de la aplicación
final routes = <String, WidgetBuilder>{
  // Splash
  'bienvenida': (BuildContext context) => const SplashScreen(),

  // Menu
  'menuComida': (BuildContext context) => MenuComida(),

  // principal
  'menu': (BuildContext context) => const TabsPage(),

  // login
  'login': (BuildContext context) => const LoginPage(),
  // register
  'register': (BuildContext context) => const SignUp(),
  // cart
  'cartPage': (BuildContext context) => const CartPage()
};
