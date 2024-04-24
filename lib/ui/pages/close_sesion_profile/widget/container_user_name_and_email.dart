// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';

class containerUserNameAndEmail extends StatelessWidget {
  const containerUserNameAndEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            LogIn.userName ?? 'Cargando...',
            style: const TextStyle(fontSize: 24),
          ),
          Text(
            LogIn.userEmail ?? 'Cargando...',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
