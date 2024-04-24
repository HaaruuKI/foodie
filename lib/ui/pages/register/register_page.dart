// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/register/function_register.dart';
import 'package:foodie/ui/button.dart';
import 'package:foodie/ui/pages/register/widget/button_navigate_login.dart';
import 'package:foodie/ui/pages/register/widget/textfield_email.dart';
import 'package:foodie/ui/pages/register/widget/textfield_last_name.dart';
import 'package:foodie/ui/pages/register/widget/textfield_name.dart';
import 'package:foodie/ui/pages/register/widget/textfield_password.dart';
import 'package:foodie/ui/pages/register/widget/textfield_phone.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(builder: (BuildContext context) {
          return const buttonNavigateLogin();
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
                  textfieldName(nameController: _nameController),
                  textfieldLastName(lastNameController: _lastNameController),
                  textfieldEmail(emailController: _emailController),
                  textfieldPhone(phoneController: _phoneController),
                  textfieldPassword(passwordController: _passwordController),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () async {
                      FunctionRegister.register(
                          _formKey,
                          _emailController,
                          _passwordController,
                          _nameController,
                          _lastNameController,
                          _phoneController,
                          context,
                          cargandoTrue,
                          cargandoFalse);
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
