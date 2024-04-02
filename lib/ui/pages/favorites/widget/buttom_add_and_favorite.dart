import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/add_to_shopping_cart.dart';
import 'package:foodie/domain/entities/favorite/funtion_favorite.dart';
import 'package:foodie/domain/entities/snack_bar_send_data.dart';
import 'package:foodie/ui/colors.dart';

Widget ButtomAddAndFavorite(String name, int price, String img,
    BuildContext context, Map<String, dynamic> item) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {
          FuncionFavorites.DeleteItem(item['key']);
        },
        icon: const Icon(
          Icons.favorite_border,
          color: amarillo,
          size: 26,
        ),
      ),
      IconButton(
        onPressed: () {
          FuntionShoppingCart.EnviarDatosRealtimeDatabase(name, price, img);
          FuntionShowSnackBar.ShowSnackbar(context, name);
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
