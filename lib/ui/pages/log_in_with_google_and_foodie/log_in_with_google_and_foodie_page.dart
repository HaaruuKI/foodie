// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/ui/pages/log_in_with_google_and_foodie/widget/button_log_in_with_google.dart';
import 'package:foodie/ui/pages/log_in_with_google_and_foodie/widget/button_navigate_login.dart';

class LogInWithGoogleOrFoodie extends StatefulWidget {
  const LogInWithGoogleOrFoodie({super.key});

  @override
  State<LogInWithGoogleOrFoodie> createState() =>
      _LogInWithGoogleOrFoodieState();
}

class _LogInWithGoogleOrFoodieState extends State<LogInWithGoogleOrFoodie> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonNavigateLogin(),
            buttonLogInWithGoogle(),
          ],
        ),
      ),
    );
  }
}
