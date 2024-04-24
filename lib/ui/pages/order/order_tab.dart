import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/order/funtion_order.dart';
import 'package:foodie/ui/colors.dart';

import 'widget/text_date.dart';
import 'widget/text_id.dart';
import 'widget/text_price.dart';
import 'widget/text_product_list.dart';
import 'widget/text_state.dart';
import 'widget/text_total_price.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int totalOrderPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FuntionGetOrder.getDataOrders(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(
              child: Text('No hay ordenes registradas'),
            );
          }

          final order =
              (snapshot.data!.data() as Map<String, dynamic>).values.toList();
          final filteredOrder =
              order.where((item) => item['state'] != 'entregado').toList();
          for (int i = 0; i < filteredOrder.length; i++) {
            int total = filteredOrder[i]['totalPrice'];
            totalOrderPrice += total;
          }

          return Column(
            children: [
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.only(top: 0, left: 5, bottom: 5),
                child: Text(
                  'Mis ordenes',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredOrder.length,
                  itemBuilder: (context, index) {
                    final String state = filteredOrder[index]['state'];
                    final int totalPrice = filteredOrder[index]['totalPrice'];
                    final List products = filteredOrder[index]['products'];
                    final String id = filteredOrder[index]['key'];
                    final int timestamp = filteredOrder[index]['timestamp'];

                    final date = DateTime.fromMicrosecondsSinceEpoch(timestamp)
                        .toString();

                    return GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, 'orderQR', arguments: {
                        'key': id,
                        'products': products,
                        'totalPrice': totalPrice,
                        'timestamp': timestamp,
                      }),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textId(id: id),
                              textDate(date: date),
                              const Text(
                                'Productos:',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              textProductList(products: products),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textPrice(totalPrice: totalPrice),
                                  textState(state: state),
                                ],
                              ),
                              const Center(
                                child: Text(
                                  'Preciona para generar QR',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: amarillo),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total:',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            textTotalPrice(totalOrderPrice: totalOrderPrice),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
