// ignore_for_file: unnecessary_string_interpolations, non_constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';

class MoneyFoodie extends StatefulWidget {
  const MoneyFoodie({super.key});

  @override
  _MoneyFoodieState createState() => _MoneyFoodieState();
}

class _MoneyFoodieState extends State<MoneyFoodie> {
  int? credits;

  @override
  void initState() {
    super.initState();
    credits = LogIn.moneyfoodie;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            'assets/my-Logo.png',
            scale: 5,
          ),
          TextButton(
            onPressed: () async {
              await LogIn.auth.signOut();
              await LogIn.googleSignIn.signOut();
              Navigator.pushNamed(context, 'menu');

              setState(() {
                credits = LogIn.moneyfoodie;
              });
            },
            child: Text(
              '${credits?.toStringAsFixed(2) ?? '00.00'}',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
      centerTitle: false,
    );
  }
}
