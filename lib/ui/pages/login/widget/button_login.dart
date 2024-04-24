import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/login/funtion_login.dart';
import 'package:foodie/ui/button.dart';

Widget buttonLogin(
    TextEditingController emailController,
    TextEditingController passwordController,
    bool cargando,
    BuildContext context,
    GlobalKey<FormState> formKey,
    Function funtionCargarTrue,
    Function funtionCargarFalse) {
  return ElevatedButton(
    style: buttonPrimary,
    onPressed: () {
      FunctionGetLogin.signInWithEmailAndPassword(
          emailController,
          formKey,
          passwordController,
          cargando,
          context,
          funtionCargarTrue,
          funtionCargarFalse);
    },
    child: const Text('Iniciar sesión'),
  );
}
