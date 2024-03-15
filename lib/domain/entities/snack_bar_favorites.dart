import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

class ShowSnackBarsFavorites {
  static Future<void> ShowSnackBarsFavorite(
      BuildContext context, String nombre) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Se agrego $nombre a favoritos',
          style: TextStyle(color: Colors.white),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: amarillo,
        duration: Duration(seconds: 2),
        width: 200,
      ),
    );
  }
}
