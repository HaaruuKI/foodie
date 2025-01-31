import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/favorite/funtion_favorite.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/domain/entities/navigator/navigate_to.dart';
import 'package:foodie/ui/colors.dart';

class buttonAddFavorite extends StatelessWidget {
  const buttonAddFavorite({
    super.key,
    required this.widget,
  });
  final widget;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.favorite_border, color: amarillo, size: 26),
      onPressed: () {
        if (LogIn.user != null) {
          FuncionFavorites.AddToFavorite(widget.name, widget.price, widget.img);
          print('usuario registrado');
        } else {
          NavigateTo.profile(context);
          print('usuario no registrado');
        }
      },
    );
  }
}
