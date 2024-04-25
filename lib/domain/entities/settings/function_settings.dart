import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';

class FunctionSettings {
  static Future<bool> checkEmailExists(
      String email, String name, String numphone) async {
    QuerySnapshot querySnapshot = await LogIn.firestore
        .collection('Users')
        .where('email', isEqualTo: email)
        .where('name', isEqualTo: name)
        .where('numero', isEqualTo: numphone)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  static Future<void> updateData(
      TextEditingController nameController,
      TextEditingController lastnameController,
      TextEditingController numphoneController,
      String? email,
      String? name,
      String? numphone,
      BuildContext context) async {
    String? user = LogIn.user?.uid;
    if (nameController.text.isNotEmpty ||
        lastnameController.text.isNotEmpty ||
        numphoneController.text.isNotEmpty) {
      checkEmailExists(email ?? '', name ?? '', numphone ?? '').then((value) {
        if (value) {
          LogIn.firestore.collection('Users').doc(user).update({
            if (nameController.text.isNotEmpty) 'name': nameController.text,
            if (lastnameController.text.isNotEmpty)
              'lastname': lastnameController.text,
            if (numphoneController.text.isNotEmpty)
              'numero': numphoneController.text,
          });
          print('Datos actualizados');
          print(email);
        } else {
          LogIn.firestore.collection('Users').doc(user).set({
            if (nameController.text.isNotEmpty) 'name': nameController.text,
            if (lastnameController.text.isNotEmpty)
              'lastname': lastnameController.text,
            if (numphoneController.text.isNotEmpty)
              'numero': numphoneController.text,
            'email': email,
            'moneyfoodie': 0,
          });
          print('Subir datos');
          print(email);
        }
      });
    }
    Navigator.pushNamed(context, 'menu');
  }
}
