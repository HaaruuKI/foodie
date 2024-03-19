import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/ui/widget/btn_back.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController nameController = TextEditingController();

  String name = LogIn.userName!;
  String lastname = LogIn.userLastName!;
  String email = LogIn.userEmail!;
  String numphone = LogIn.userNumPhone!;

  @override
  void initState() {
    super.initState();
    LogIn().GetCurrentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: btnBack(context),
        title: const Text('Perfil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Actualizar informacion',
              style: TextStyle(fontSize: 18.0),
            ),
            Container(
              margin: const EdgeInsetsDirectional.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ]),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const Text(
                      'Nombre',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      controller: TextEditingController(text: name),
                      decoration: const InputDecoration(
                        hintText: 'Nombre',
                        border: OutlineInputBorder(
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
                      controller: TextEditingController(text: lastname),
                      decoration: const InputDecoration(
                        hintText: 'Apellido',
                        border: OutlineInputBorder(
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
                      decoration: const InputDecoration(
                        hintText: 'Correo',
                        border: OutlineInputBorder(
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
                      controller: TextEditingController(text: numphone),
                      decoration: const InputDecoration(
                        hintText: 'Numero de telefono',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
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
