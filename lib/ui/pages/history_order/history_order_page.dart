// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_build_context_synchronously, unnecessary_import, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/history_order/funtion_history_order.dart';
import 'package:foodie/ui/pages/history_order/widget/container_total_price.dart';
import 'package:foodie/ui/pages/history_order/widget/expanded_container.dart';
import 'package:foodie/ui/widget/btn_back.dart';

class HistoryOrder extends StatefulWidget {
  const HistoryOrder({super.key});

  @override
  _HistoryOrderState createState() => _HistoryOrderState();
}

class _HistoryOrderState extends State<HistoryOrder> {
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: FuntionGetOrder.GetOrdersData(totalPrice),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final orders = snapshot.data!;
            double totalPrice = 0;
            for (var element in orders) {
              totalPrice += element['totalPrice'];
            }
            return Column(
              children: [
                btnBack(context),
                const SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.only(top: 0, left: 5, bottom: 5),
                  child: Text(
                    'Historial de ordenes',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                expandedContainer(orders),
                containerTotalPrice(totalPrice),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
