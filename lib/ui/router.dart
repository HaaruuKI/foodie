import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/cart_store/CartPage.dart';
import 'package:foodie/ui/pages/details/details_page.dart';
import 'package:foodie/ui/pages/login/login_page.dart';
// import 'package:foodie/ui/pages/menu/menu.dart';
import 'package:foodie/ui/pages/register/sing_up.dart';
import 'package:foodie/ui/pages/search/search_page.dart';
import 'package:foodie/ui/pages/splash_screen/splashScreen.dart';
import 'package:foodie/ui/pages/tabs/tabs_page.dart';

/// Rutas de la aplicación
final routes = <String, WidgetBuilder>{
  // Splash
  'bienvenida': (BuildContext context) => const SplashScreen(),

  // Menu
  // 'menu_page': (BuildContext context) => const MenuPage(),

  // principal
  'menu': (BuildContext context) => const TabsPage(),

  // login
  'login': (BuildContext context) => const LoginPage(),
  // register
  'register': (BuildContext context) => const SignUp(),
  // cart
  'cartPage': (BuildContext context) => const CartPage(),
  // Search
  'search': (BuildContext context) => const SearchPage(),
  // details
  'details': (BuildContext context) => DetailsPage(),
};
