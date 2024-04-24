// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/domain/entities/register_google/function_register_google.dart';
import 'package:foodie/ui/button.dart';

import 'widget/btn_back_login.dart';
import 'widget/textfield_last_name.dart';
import 'widget/textfield_password.dart';
import 'widget/textfield_phone.dart';
import 'widget/textfield_user_name.dart';

class RegisterGooglePage extends StatefulWidget {
  const RegisterGooglePage({Key? key});

  @override
  State<RegisterGooglePage> createState() => _RegisterGooglePageState();
}

class _RegisterGooglePageState extends State<RegisterGooglePage> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _emailController = TextEditingController();
  final _numeroController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _cargando = false;

  void cargandoTrue() {
    setState(() {
      _cargando = true;
    });
  }

  void cargandoFalse() {
    setState(() {
      _cargando = false;
    });
  }

  @override
  void initState() {
    print(LogIn.auth.currentUser?.email);
    print(LogIn.auth.currentUser?.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(builder: (BuildContext context) {
          return btnBack(context, Colors.black);
        }),
      ),
      body: _cargando
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  const Center(
                    child: Text(
                      "Crear una cuenta",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                  userName(context, _nombreController),
                  lastName(context, _apellidoController),
                  // emailTextfield(context, _emailController),
                  phoneTextfield(context, _numeroController),
                  passwordTextfield(context, _passwordController),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () async {
                      FunctionRegisterGoogle.sendGoogleAccountData(
                          _formKey,
                          cargandoTrue,
                          cargandoFalse,
                          _emailController,
                          _passwordController,
                          _nombreController,
                          _apellidoController,
                          _numeroController,
                          context);
                    },
                    child: const Text('Registrarse'),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 40.0),
                    child: const Text(
                      "Dando click en 'Registrarse' estas aceptando nuestros términos y condiciones.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
