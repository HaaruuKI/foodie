import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

class ShowSnackBars {
  static Future<void> showSnackbar(BuildContext context, String nombre) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Se agrego $nombre al carrito',
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
