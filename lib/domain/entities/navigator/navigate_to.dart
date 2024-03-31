import 'package:flutter/material.dart';

class NavigateTo {
  // Navigate to the menu page with arguments
  static Future<void> MenuPageWithArguments(
      BuildContext context, String category) async {
    Navigator.pushNamed(context, 'menu_page',
        arguments: {'category': category});
  }
}