// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/domain/entities/order/name_order.dart';

class FuntionGetOrder {
  static Stream<DocumentSnapshot> getDataOrders() {
    final ordersRef = FirebaseFirestore.instance
        .collection(GetNameOrder.get_key_order)
        .doc(LogIn.user!.uid)
        .snapshots();

    return ordersRef;
  }
}
