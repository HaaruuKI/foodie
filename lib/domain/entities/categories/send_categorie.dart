import 'package:flutter/material.dart';

class BtnCategorie {
  static Future<void> NavigateToMenuPage(
      BuildContext context, String category) async {
    Navigator.pushNamed(context, 'menu_page',
        arguments: {'category': category});
  }
}
