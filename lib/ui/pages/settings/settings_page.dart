// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/ui/button.dart';
import 'package:foodie/ui/widget/btn_back.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numphoneController = TextEditingController();

  String? name = LogIn.userName;
  String? email = LogIn.userEmail;
  String? lastname = LogIn.userLastName;
  String? numphone = LogIn.userNumPhone;

  @override
  void initState() {
    super.initState();
    LogIn().GetCurrentUser;
  }

  Future<bool> checkEmailExists(String email) async {
    QuerySnapshot querySnapshot = await LogIn.firestore
        .collection('Users')
        .where('email', isEqualTo: email)
        .where('name', isEqualTo: name)
        .where('numero', isEqualTo: numphone)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  void updateData() {
    String? user = LogIn.user?.uid;
    if (nameController.text.isNotEmpty ||
        lastnameController.text.isNotEmpty ||
        numphoneController.text.isNotEmpty) {
      checkEmailExists(email ?? '').then((value) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BtnBack(context),
            const Text(
              'Actualizar informacion',
              style: TextStyle(fontSize: 18.0),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const Text(
                      'Nombre',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: name,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Apellido',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      controller: lastnameController,
                      decoration: InputDecoration(
                        hintText: lastname,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Correo electronico',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      enabled: false,
                      controller: TextEditingController(text: email),
                      decoration: InputDecoration(
                        hintText: email,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Numero de telefono',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      controller: numphoneController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        hintText: numphone,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: buttonPrimary,
                      onPressed: () {
                        updateData();
                      },
                      child: const Text('Actualizar'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
