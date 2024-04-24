// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';

class buttonHistory extends StatelessWidget {
  const buttonHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, 'history');
        },
        child: const Text(
          'Historial de ordenes',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
