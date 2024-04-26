import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/more_product/widget/more_wiget.dart';
import 'package:foodie/ui/widget/button_add_favorite.dart';
import 'package:foodie/ui/widget/button_send_data_to_shopping_cart.dart';

class buttonFavoriteAndShoppingCart extends StatelessWidget {
  const buttonFavoriteAndShoppingCart({
    super.key,
    required this.widget,
  });
  final MoreWidget widget;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buttonAddFavorite(widget: widget),
        buttonSendDataToShoppingCart(widget: widget),
        // IconButton(
        //   onPressed: () {
        //     if (LogIn.user != null) {
        //       FuncionFavorites.AddToFavorite(
        //           widget.name, widget.price, widget.img);
        //     } else {
        //       NavigateTo.profile(context);
        //     }
        //   },
        //   icon: const Icon(
        //     Icons.favorite_border,
        //     color: amarillo,
        //     size: 26,
        //   ),
        // ),
        // IconButton(
        //   onPressed: () {
        //     if (LogIn.user != null) {
        //       FuntionShoppingCart.EnviarDatosRealtimeDatabase(
        //           widget.name, widget.price, widget.img);
        //       FuntionShowSnackBar.showSentText(context, widget.name);
        //     } else {
        //       NavigateTo.profile(context);
        //     }
        //   },
        //   icon: const Icon(
        //     CupertinoIcons.cart,
        //     color: amarillo,
        //     size: 26,
        //   ),
        // ),
      ],
    );
  }
}
