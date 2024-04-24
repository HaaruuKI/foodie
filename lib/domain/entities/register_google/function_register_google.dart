// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';

class FunctionRegisterGoogle {
  static Future<void> sendGoogleAccountData(
    formKey,
    Function cargandoTrue,
    Function cargandoFalse,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController nombreController,
    TextEditingController apellidoController,
    TextEditingController numeroController,
    BuildContext context,
  ) async {
    if (formKey.currentState!.validate()) {
      cargandoTrue();

      try {
        // Registrar usuario en Firebase Authentication
        // final userCredential = await FirebaseAuth.instance
        //     .createUserWithEmailAndPassword(
        //         email: emailController.text, password: passwordController.text);

        // Obtener uid del usuario
        final uid = LogIn.auth.currentUser?.uid;
        final email = LogIn.auth.currentUser?.email;

        // Crear un nuevo documento en Firestore con el uid del usuario
        await FirebaseFirestore.instance.collection('Users').doc(uid).set({
          'name': nombreController.text,
          'lastname': apellidoController.text,
          'email': email,
          'numero': numeroController.text,
          'moneyfoodie': 0,
        });

        // Mostrar mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Usuario registrado correctamente.')));

        // Redirigir al usuario a la pantalla de inicio
        Navigator.pushNamed(context, 'menu');
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
