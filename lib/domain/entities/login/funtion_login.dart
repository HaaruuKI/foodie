import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FunctionGetLogin {
  static Future<void> signInWithEmailAndPassword(
      TextEditingController emailController,
      GlobalKey<FormState> formKey,
      TextEditingController passwordController,
      bool cargando,
      BuildContext context,
      Function funtionCargarTrue,
      Function funtionCargarFalse) async {
    if (formKey.currentState!.validate()) {
      funtionCargarTrue();
      // setState(() {
      // cargando = true;
      // });
      try {
        // Iniciar sesión con Firebase Authentication
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          DocumentSnapshot doc = await FirebaseFirestore.instance
              .collection('Users')
              .doc(user.uid)
              .get();
          print("Nombre (Firestore): ${doc.get('name')}");
          print("Email (Firestore): ${doc.get('email')}");
        }
        // Mostrar mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Sesión iniciada correctamente')));

        // Redirigir al usuario al menu
        Navigator.pushNamed(context, 'menu');
      } on FirebaseAuthException catch (e) {
        // Mostrar mensaje de error
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message!)));
      } finally {
        // setState(() {
        funtionCargarFalse();
        // });
      }
    }
  }
}
