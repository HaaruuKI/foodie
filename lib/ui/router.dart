import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/cart_store/shopping_cart_page.dart';
import 'package:foodie/ui/pages/details/details_page.dart';
import 'package:foodie/ui/pages/history_order/history_order.dart';
import 'package:foodie/ui/pages/login/login_page.dart';
import 'package:foodie/ui/pages/menu/menu.dart';
import 'package:foodie/ui/pages/order_qr/order_qr_page.dart';
import 'package:foodie/ui/pages/profile/profile_tab.dart';
import 'package:foodie/ui/pages/recover_password/recuperarpass.dart';
import 'package:foodie/ui/pages/register/sing_up.dart';
import 'package:foodie/ui/pages/register_google/register_google_page.dart';
import 'package:foodie/ui/pages/search/search_page.dart';
import 'package:foodie/ui/pages/settings/settings_page.dart';
import 'package:foodie/ui/pages/splash_screen/splashScreen.dart';
import 'package:foodie/ui/pages/tabs/tabs_page.dart';

/// Rutas de la aplicación
final routes = <String, WidgetBuilder>{
  // Splash
  'bienvenida': (BuildContext context) => const SplashScreen(),

  // Menu
  'menu_page': (BuildContext context) => MenuPage(),

  // principal
  'menu': (BuildContext context) => const TabsPage(),

  // login
  'login': (BuildContext context) => const LoginPage(),
  // register
  'register': (BuildContext context) => const SignUp(),
  // cart
  'cartPage': (BuildContext context) => CartPage(),
  // Search
  'search': (BuildContext context) => const SearchPage(),
  // details
  'details': (BuildContext context) => DetailsPage(),
  // profile
  'profile': (BuildContext context) => const ProfileUser(),
  // history
  'history': (BuildContext context) => const HistoryOrder(),
  // recover password
  'recoverPass': (BuildContext context) => const RecoverPassword(),
  // Generate QR Page
  'orderQR': (BuildContext context) => OrderQRPage(),
  // settigns
  'settings': (context) => const SettingsPage(),
  // register google
  'registerGoogle': (context) => const RegisterGooglePage(),
};
