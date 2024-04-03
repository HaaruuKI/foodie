import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/login/widget/button_login.dart';
import 'package:foodie/ui/pages/login/widget/button_recover_password.dart';
import 'package:foodie/ui/pages/login/widget/button_register.dart';
import 'package:foodie/ui/pages/login/widget/email_input.dart';
import 'package:foodie/ui/pages/login/widget/password_input.dart';
import 'package:foodie/ui/pages/login/widget/text_bienvenida.dart';

Widget containerWidget(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController passwordController,
    bool cargando,
    Function funtionCargar) {
  return Transform.translate(
    offset: const Offset(0.0, -50.0),
    child: Container(
      width: double.infinity,
      height: 600,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              textBienvenida(),
              const SizedBox(height: 40),
              emailInput(emailController),
              passwordInput(passwordController),
              const SizedBox(height: 16.0),
              buttonLogin(emailController, passwordController, cargando,
                  context, formKey, funtionCargar),
              const SizedBox(height: 20),
              buttonRecoverPassword(context),
              const SizedBox(height: 20),
              buttonRegister(context),
            ],
          ),
        ),
      ),
    ),
  );
}
