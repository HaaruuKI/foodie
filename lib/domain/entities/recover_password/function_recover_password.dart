import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FunctionRecoverPassword {
  static Future<void> verificarDatos(
      BuildContext context,
      TextEditingController _emailController,
      bool _cargando,
      Function cargandoTrue,
      Function cargandoFalse) async {
    if (_emailController.text.isNotEmpty) {
      cargandoTrue();

      try {
        // Enviar correo electrónico para recuperar la contraseña
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailController.text);

        // Mostrar mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Se ha enviado un correo electrónico para recuperar la contraseña')));

        // Redirigir al usuario a la pantalla de inicio de sesión
        Navigator.pushNamed(context, 'login');
      } on FirebaseAuthException catch (e) {
        // Mostrar mensaje de error
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message!)));
      } finally {
        cargandoFalse();
      }
    }
  }
}
