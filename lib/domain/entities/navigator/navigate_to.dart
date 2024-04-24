import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NavigateTo {
  // Navigate to the menu page with arguments
  static Future<void> menuPageWithArguments(
      BuildContext context, String category) async {
    Navigator.pushNamed(context, 'menu_page',
        arguments: {'category': category});
  }

  // Navigate to the profile
  static Future<void> profile(BuildContext context) async {
    Navigator.pushNamed(context, 'profile');
  }

  static Future<void> details(BuildContext context,
      List<DocumentSnapshot<Object?>> results, int index) async {
    Navigator.pushNamed(context, 'details', arguments: {
      'name': results[index]['name'],
      'price': results[index]['price'],
      'img': results[index]['img_url'],
      'des': results[index]['description'],
    });
  }
}
