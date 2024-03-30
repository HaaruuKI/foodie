// ignore_for_file: file_names, usekey_in_widgetconstructors, prefer_const_constructors, sizedbox_for_itespace, preferconst_literals_to_createimmutables, library__types_in_public_, use_buildcontext_synchronously, library_private_types_in_public_api, use_build_context_synchronously, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/cart_store/widget/shopping_cart_widget.dart';
import 'package:foodie/ui/widget/btn_back.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: btnBack(context),
      ),
      body: ShoppingCartWidget(),
    );
  }
}
