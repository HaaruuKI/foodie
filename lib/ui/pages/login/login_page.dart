// ignore_for_file: use_build_context_synchronously, avoid_print, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/login/widget/container_widget.dart';
import 'package:foodie/ui/pages/login/widget/image_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool cargando = false;
  void funtionCargar() {
    setState(() {
      cargando = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cargando
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: formKey,
              child: ListView(
                children: [
                  imageWidget(context),
                  containerWidget(context, formKey, emailController,
                      passwordController, cargando, funtionCargar)
                ],
              ),
            ),
    );
  }
}
