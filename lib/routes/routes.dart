import 'package:flutter/material.dart';
import 'package:foodie/feactures/splashScreen/splashScreen.dart';

/// Rutas de la aplicación
final routes = <String, WidgetBuilder>{
  'bienvenida': (BuildContext context) => SplashScreen(),

  // Ruta de Historial de Ordenes
  // 'historial': (BuildContext context) => const OrdenHistorial(),
};
