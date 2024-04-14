import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/add_to_shopping_cart.dart';
import 'package:foodie/domain/entities/favorite/funtion_favorite.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/domain/entities/snack_bar_send_data.dart';
import 'package:foodie/ui/colors.dart';

Widget addFavoriteAndShoppingCart(
    BuildContext context, String name, int price, String img) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            if (LogIn.user != null) {
              FuncionFavorites.AddToFavorite(name, price, img);
              print('usuario registrado');
            } else {
              print('usuario no registrado');
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
              print('usuario registrado');
            } else {
              print('usuario no registrado');
            }
          },
          icon: const Icon(
            CupertinoIcons.cart,
            color: amarillo,
            size: 26,
          ),
        ),
      ],
    ),
  );
}
