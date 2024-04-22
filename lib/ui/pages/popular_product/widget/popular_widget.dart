import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/favorite/funtion_favorite.dart';
import 'package:foodie/domain/entities/add_to_shopping_cart.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/domain/entities/navigator/navigate_to.dart';
import 'package:foodie/domain/entities/snack_bar_send_data.dart';
import 'package:foodie/ui/colors.dart';
import 'package:foodie/ui/widget/image_widget.dart';
import 'package:foodie/ui/widget/name_widget.dart';

class PopularesItem extends StatefulWidget {
  final String name;
  final int price;
  final String img;
  final VoidCallback onTap;

  const PopularesItem({
    super.key, // Add Key parameter
    required this.name,
    required this.price,
    required this.img,
    required this.onTap,
  }); // Use super constructor

  @override
  State<PopularesItem> createState() => _PopularesItemState();
}

class _PopularesItemState extends State<PopularesItem> {
  @override
  void initState() {
    super.initState();
    LogIn().GetCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.name;
    final img = widget.img;
    final sendDetails = widget.onTap;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 170,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageWidget(img),
                // CachedNetworkImage(
                //   imageUrl: widget.img,
                //   placeholder: (context, url) =>
                //       const CircularProgressIndicator(),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),
                const SizedBox(height: 12),
                nameWidget(name),
                const SizedBox(height: 4),
                Text(
                  "\$ ${widget.price}",
                  style: const TextStyle(
                    fontSize: 17,
                    color: amarillo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border,
                          color: amarillo, size: 26),
                      onPressed: () {
                        if (LogIn.user != null) {
                          FuncionFavorites.AddToFavorite(
                              widget.name, widget.price, widget.img);
                          print('usuario registrado');
                        } else {
                          NavigateTo.Profile(context);
                          print('usuario no registrado');
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(CupertinoIcons.cart,
                          color: amarillo, size: 26),
                      onPressed: () {
                        if (LogIn.user != null) {
                          FuntionShowSnackBar.showSentText(
                              context, widget.name);
                          FuntionShoppingCart.EnviarDatosRealtimeDatabase(
                              widget.name, widget.price, widget.img);
                          print('usuario registrado');
                        } else {
                          NavigateTo.Profile(context);
                          print('usuario no registrado');
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}