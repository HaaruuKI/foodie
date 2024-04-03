// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/history_order/widget/datetime.dart';
import 'package:foodie/ui/pages/history_order/widget/id_order.dart';
import 'package:foodie/ui/pages/history_order/widget/price_of_order.dart';
import 'package:foodie/ui/pages/history_order/widget/products_list.dart';
import 'package:foodie/ui/pages/history_order/widget/state.dart';

Widget expandedContainer(List<Map<String, dynamic>> orders) {
  return Expanded(
    child: ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        final id_order = order['key'];
        final datetime_order =
            DateTime.fromMicrosecondsSinceEpoch(order['timestamp']).toString();
        final products_order = order['products'];
        final price_of_order = order['totalPrice'];
        final state_order = order['state'];

        return Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                idOrder(id_order),
                const SizedBox(height: 8),
                datetime(datetime_order),
                const SizedBox(height: 8),
                const Text(
                  'Productos:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                productList(products_order),
                const SizedBox(height: 8),
                priceOfOrder(price_of_order),
                state(state_order),
              ],
            ),
          ),
        );
      },
    ),
  );
}
