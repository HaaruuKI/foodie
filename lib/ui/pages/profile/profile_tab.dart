// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/ui/pages/profile/widget/profile_user_widget.dart';
import 'package:foodie/ui/pages/profile/widget/profile_user_widget_guest.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  void initState() {
    super.initState();
    LogIn().GetCurrentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            if (LogIn.user != null)
              const Profile()
            else
              const ProfileUserGuest()
          ],
        ),
      ),
    );
  }
}
