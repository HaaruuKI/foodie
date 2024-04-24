import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/add_to_shopping_cart.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/domain/entities/navigator/navigate_to.dart';
import 'package:foodie/domain/entities/snack_bar_send_data.dart';
import 'package:foodie/ui/colors.dart';
import 'package:foodie/ui/pages/popular_product/widget/popular_widget.dart';

class buttonSendDataToShoppingCart extends StatelessWidget {
  const buttonSendDataToShoppingCart({
    super.key,
    required this.widget,
  });

  final PopularesItem widget;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(CupertinoIcons.cart, color: amarillo, size: 26),
      onPressed: () {
        if (LogIn.user != null) {
          FuntionShowSnackBar.showSentText(context, widget.name);
          FuntionShoppingCart.EnviarDatosRealtimeDatabase(
              widget.name, widget.price, widget.img);
          print('usuario registrado');
        } else {
          NavigateTo.profile(context);
          print('usuario no registrado');
        }
      },
    );
  }
}
