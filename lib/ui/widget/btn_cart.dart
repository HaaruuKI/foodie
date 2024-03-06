import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

Widget btn_cart(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.pushNamed(context, 'cartPage');
    },
    backgroundColor: Colors.white,
    child: const Icon(
      CupertinoIcons.cart,
      size: 28,
      color: amarillo,
    ),
  );
}
