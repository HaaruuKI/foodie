// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FunctionRegister {
  static Future<void> register(
    formKey,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController nameController,
    TextEditingController lastNameController,
    TextEditingController phoneController,
    BuildContext context,
    Function cargandoTrue,
    Function cargandoFalse,
  ) async {
    if (formKey.currentState!.validate()) {
      cargandoTrue();
      try {
        // Registrar usuario en Firebase Authentication
        final userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        // Obtener uid del usuario
        final uid = userCredential.user!.uid;

        // Crear un nuevo documento en Firestore con el uid del usuario
        await FirebaseFirestore.instance.collection('Users').doc(uid).set({
          'name': nameController.text,
          'lastname': lastNameController.text,
          'email': emailController.text,
          'numero': phoneController.text,
        });

        // Autenticar cuenta
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();

        // Mostrar mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Usuario registrado correctamente. Por favor, verifica tu correo electrónico')));

        // Redirigir al usuario a la pantalla de inicio
        Navigator.of(context).pop();
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
