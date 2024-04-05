// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie/domain/entities/menu/name_menu.dart';

class FuntionGetMenu {
  static Stream<QuerySnapshot<Object?>> GetMenuData(String category) {
    return FirebaseFirestore.instance
        .collection(GetNameMenu.get_name_collecion)
        .where(GetNameMenu.get_category_collecion, isEqualTo: category)
        .snapshots();
  }
}
