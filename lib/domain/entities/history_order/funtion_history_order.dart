import 'package:foodie/domain/entities/history_order/name_history_order.dart';
import 'package:foodie/domain/entities/log_in.dart';

class FuntionGetOrder {
  static Stream<List<Map<String, dynamic>>> GetOrdersData(double totalPrice) {
    final ordersRef = LogIn.databaseRef
        .child(GetNameHistoryOrder.get_key_order)
        .child(LogIn.user!.uid);

    return ordersRef.onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        final List<Map<String, dynamic>> ordersList = [];
        data.forEach((key, value) {
          final order = Map<String, dynamic>.from(value as dynamic);
          final products_order = order[GetNameHistoryOrder.get_products_order];
          final double totalprice_order =
              order[GetNameHistoryOrder.get_total_price_order];
          final timestamp_order = order[GetNameHistoryOrder.get_datetime_order];
          final state_order = order[GetNameHistoryOrder.get_state_order];
          if (state_order == "entregado") {
            totalPrice += totalprice_order;
            ordersList.add({
              'key': key,
              'products': products_order,
              'totalPrice': totalprice_order,
              'timestamp': timestamp_order,
              'state': state_order,
            });
          }
        });
        return ordersList;
      } else {
        return [];
      }
    });
  }
}
