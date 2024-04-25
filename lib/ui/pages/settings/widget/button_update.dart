// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/settings/function_settings.dart';
import 'package:foodie/ui/button.dart';

class buttonUpdate extends StatelessWidget {
  const buttonUpdate({
    super.key,
    required this.nameController,
    required this.lastnameController,
    required this.numphoneController,
    required this.email,
    required this.name,
    required this.numphone,
  });

  final TextEditingController nameController;
  final TextEditingController lastnameController;
  final TextEditingController numphoneController;
  final String? email;
  final String? name;
  final String? numphone;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonPrimary,
      onPressed: () {
        FunctionSettings.updateData(nameController, lastnameController,
            numphoneController, email, name, numphone, context);
      },
      child: const Text('Actualizar'),
    );
  }
}
