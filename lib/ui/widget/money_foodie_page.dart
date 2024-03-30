// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';

class FoodieMoney extends StatefulWidget {
  const FoodieMoney({super.key});

  @override
  State<FoodieMoney> createState() => _FoodieMoneyState();
}

class _FoodieMoneyState extends State<FoodieMoney> {
  int? credits = LogIn.moneyfoodie;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          'assets/my-Logo.png',
          scale: 5,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            '${credits?.toStringAsFixed(2) ?? '00.00'}',
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
