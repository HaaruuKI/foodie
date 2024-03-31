import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

class ShowSnackBarsFavorites {
  // ignore: non_constant_identifier_names
  static Future<void> ShowSnackBarsFavorite(
      BuildContext context, String nombre) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Se agrego $nombre a favoritos',
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
