// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/ui/pages/settings/widget/button_update.dart';
import 'package:foodie/ui/pages/settings/widget/textfield_email.dart';
import 'package:foodie/ui/pages/settings/widget/textfield_last_name.dart';
import 'package:foodie/ui/pages/settings/widget/textfield_name.dart';
import 'package:foodie/ui/pages/settings/widget/textfield_num_phone.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            btnBack(context),
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
                    textfieldName(nameController: nameController, name: name),
                    const Text(
                      'Apellido',
                      style: TextStyle(fontSize: 18),
                    ),
                    textfieldLastName(
                        lastnameController: lastnameController,
                        lastname: lastname),
                    const Text(
                      'Correo electronico',
                      style: TextStyle(fontSize: 18),
                    ),
                    textfieldEmail(email: email),
                    const Text(
                      'Numero de telefono',
                      style: TextStyle(fontSize: 18),
                    ),
                    textfieldNumPhone(
                        numphoneController: numphoneController,
                        numphone: numphone),
                    buttonUpdate(
                        nameController: nameController,
                        lastnameController: lastnameController,
                        numphoneController: numphoneController,
                        email: email,
                        name: name,
                        numphone: numphone),
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
