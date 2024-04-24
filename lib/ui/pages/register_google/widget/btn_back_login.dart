import 'package:flutter/material.dart';

Widget btnBack(BuildContext context, Color color) {
  return IconButton(
    icon: Icon(
      Icons.arrow_back_rounded,
      color: color,
      size: 50.0,
    ),
    onPressed: () {
      Navigator.pushNamed(context, 'login');
    },
  );
}
