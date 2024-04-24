// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/ui/pages/close_sesion_profile/widget/button_history.dart';
import 'package:foodie/ui/pages/close_sesion_profile/widget/button_settings.dart';
import 'package:foodie/ui/pages/close_sesion_profile/widget/button_sign_out.dart';
import 'package:foodie/ui/pages/close_sesion_profile/widget/container_user_name_and_email.dart';
import 'package:foodie/ui/widget/money_foodie.dart';

class CloseSesionProfilePage extends StatefulWidget {
  const CloseSesionProfilePage({super.key});

  @override
  State<CloseSesionProfilePage> createState() => _CloseSesionProfilePageState();
}

class _CloseSesionProfilePageState extends State<CloseSesionProfilePage> {
  @override
  void initState() {
    super.initState();
    LogIn().GetCurrentUser;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            MoneyFoodie(),
            containerUserNameAndEmail(),
            buttonSettings(),
            buttonHistory(),
            buttonSignOut(),
          ],
        ),
      ),
    );
  }
}
