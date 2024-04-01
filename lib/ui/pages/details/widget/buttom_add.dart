// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/add_to_shopping_cart.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/domain/entities/snack_bar_send_data.dart';
import 'package:foodie/ui/colors.dart';

Widget ButtomAdd(String? name, int? price, String? img, BuildContext context) {
  return ElevatedButton.icon(
    onPressed: () {
      if (LogIn.user != null) {
        SendDataToRealtime.EnviarDatosRealtimeDatabase(name!, price!, img!);
        ShowSnackBars.ShowSnackbar(context, name);
      } else {
        Navigator.pushNamed(context, 'profile');
      }
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(amarillo),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    icon: const Icon(CupertinoIcons.cart),
    label: const Text(
      'Agregar',
      style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}
