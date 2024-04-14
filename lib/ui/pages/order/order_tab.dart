import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/ui/colors.dart';

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
        stream: FirebaseFirestore.instance
            .collection('orders')
            .doc(LogIn.user!.uid)
            .snapshots(),
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

          final data = snapshot.data!.data() as Map<String, dynamic>;
          final order = data.values.toList();
          final filteredOrder =
              order.where((item) => item['state'] != 'entregado').toList();
          for (int i = 0; i < filteredOrder.length; i++) {
            var total = filteredOrder[i]['totalPrice'] as int;
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
                    final state = filteredOrder[index]['state'];
                    final int totalPrice = filteredOrder[index]['totalPrice'];
                    final products = filteredOrder[index]['products'];
                    final key = filteredOrder[index]['key'];
                    final timestamp = filteredOrder[index]['timestamp'];

                    return GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, 'orderQR', arguments: {
                        'key': key,
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
                              Text(
                                'Orden $key',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Fecha: ${DateTime.fromMicrosecondsSinceEpoch(timestamp).toString()}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Productos:',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Column(
                                children: products
                                    .map<Widget>(
                                      (product) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${product['name']} - ${product['quantity']} C/unidad - ${product['price'].toStringAsFixed(2)}',
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total: \$${totalPrice.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Estado: $state',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                              Text(
                                '\$$totalOrderPrice', // Mostrar la suma de los totalPrice
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: amarillo,
                                ),
                              ),
                            ]),
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
