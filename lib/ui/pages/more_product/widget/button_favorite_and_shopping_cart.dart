import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/add_to_shopping_cart.dart';
import 'package:foodie/domain/entities/favorite/funtion_favorite.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/domain/entities/navigator/navigate_to.dart';
import 'package:foodie/domain/entities/snack_bar_send_data.dart';
import 'package:foodie/ui/colors.dart';

Widget buttonFavoriteAndShoppingCart(
    String name, int price, String img, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {
          if (LogIn.user != null) {
            FuncionFavorites.AddToFavorite(name, price, img);
          } else {
            NavigateTo.profile(context);
          }
        },
        icon: const Icon(
          Icons.favorite_border,
          color: amarillo,
          size: 26,
        ),
      ),
      IconButton(
        onPressed: () {
          if (LogIn.user != null) {
            FuntionShoppingCart.EnviarDatosRealtimeDatabase(name, price, img);
            FuntionShowSnackBar.showSentText(context, name);
          } else {
            NavigateTo.profile(context);
          }
        },
        icon: const Icon(
          CupertinoIcons.cart,
          color: amarillo,
          size: 26,
        ),
      ),
    ],
  );
}
