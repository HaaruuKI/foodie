import 'package:flutter/cupertino.dart';

class FuntionDetails {
  static Future<void> NavegeteDetails(BuildContext context, String name,
      int price, String img, String description) async {
    Navigator.pushNamed(context, 'details', arguments: {
      'name': name,
      'price': price,
      'img': img,
      'des': description,
    });
  }
}
