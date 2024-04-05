// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class FuntionGetMenu {
  static Stream<QuerySnapshot<Object?>> GetMenuData(String category) {
    return FirebaseFirestore.instance
        .collection('products')
        .where('category', isEqualTo: category)
        .snapshots();
  }
}
