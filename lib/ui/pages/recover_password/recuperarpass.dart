// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously, camel_case_types

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/recover_password/function_recover_password.dart';
import 'package:foodie/ui/button.dart';
import 'package:foodie/ui/colors.dart';
import 'package:foodie/ui/pages/recover_password/widget/textfield_email.dart';
import 'package:foodie/ui/widget/button_back.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final emailController = TextEditingController();

  bool cargando = false;

  void cargandoTrue() {
    setState(() {
      cargando = true;
    });
  }

  void cargandoFalse() {
    setState(() {
      cargando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cargando
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      btnBack(context),
                      const Center(
                        child: Text(
                            '¿Olvidaste tu contraseña  Google o Foodie?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0)),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        child: const Text(
                            'Favor de introducir su correo electrónico. Recibira un link para restablecer su contraseña',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: gris,
                                fontWeight: FontWeight.w500,
                                fontSize: 17.0)),
                      ),
                      textfieldEmail(emailController: emailController),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        style: buttonPrimary,
                        onPressed: () async {
                          FunctionRecoverPassword.verificarDatos(
                              context,
                              emailController,
                              cargando,
                              cargandoTrue,
                              cargandoFalse);
                        },
                        child: const Text('Recuperar contraseña'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
