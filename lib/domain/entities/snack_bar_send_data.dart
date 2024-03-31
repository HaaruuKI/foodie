// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

class ShowSnackBars {
  static Future<void> ShowSnackbar(BuildContext context, String nombre) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Se agrego $nombre al carrito',
          style: const TextStyle(color: Colors.white),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: amarillo,
        duration: const Duration(seconds: 2),
        width: 200,
      ),
    );
  }
}
