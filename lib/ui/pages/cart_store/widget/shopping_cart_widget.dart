// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/name_shopping_cart.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/domain/entities/shopping_cart/funtion_shopping_cart.dart';
import 'package:foodie/ui/colors.dart';

class ShoppingCartWidget extends StatefulWidget {
  const ShoppingCartWidget({super.key});

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<ShoppingCartWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: LogIn.databaseRef
          .child(GetNameShoppingCart.get_key_shopping_cart)
          .child(LogIn.user!.uid)
          .onValue,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>?;
          if (data != null) {
            final List<Map<String, dynamic>> items = [];
            data.forEach((key, value) {
              final product = Map<String, dynamic>.from(value as dynamic);
              items.add({
                'key': key,
                'name': product[GetNameShoppingCart.get_name_product],
                'price': product[GetNameShoppingCart.get_price_product],
                'img': product[GetNameShoppingCart.get_image_product],
                'quantity': product[GetNameShoppingCart.get_quantity_product],
              });
            });
            double totalQuantity = 0;
            double totalPrice = 0;

            totalQuantity = totalQuantity.toDouble();
            totalPrice = totalPrice.toDouble();

            for (final item in items) {
              totalQuantity += item['quantity'];
              totalPrice += item['price'] * item['quantity'];
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return ListTile(
                        title: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 9),
                                    child: Container(
                                      width: 400,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 10,
                                              offset: const Offset(0, 3),
                                            ),
                                          ]),
                                      child: Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            child: Image.network(
                                              item['img'] ??
                                                  GetNameShoppingCart.url,
                                              width: 130,
                                              height: 80,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 150,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text(
                                                    item['name'] ??
                                                        'No hay producto',
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    '\$${item['price'] ?? 0.toStringAsFixed(2)}',
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: amarillo,
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 7.0),
                                                IconButton(
                                                  onPressed: () {
                                                    FuncionShoppingCart
                                                        .IncrementQuantity(
                                                            item['key'], items);
                                                  },
                                                  icon: const Icon(
                                                    Icons.add,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  '${item['quantity'] ?? 0}',
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    FuncionShoppingCart
                                                        .DecrementQuantity(
                                                            item['key'],
                                                            items,
                                                            totalQuantity,
                                                            context);
                                                  },
                                                  icon: const Icon(
                                                    Icons.remove,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                                  'Producto:',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  totalQuantity.toStringAsFixed(0),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ]),
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
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
                                  // '0',
                                  '\$${totalPrice.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: amarillo,
                                  ),
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => FuncionShoppingCart.AddOrder(
                                      context,
                                      items,
                                      totalPrice,
                                      totalQuantity),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => amarillo)),
                                  child: const Text(
                                    'Pagar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
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
          }
        }
        return const Center(
          child: Text('No hay productos en el carrito'),
        );
      },
    );
  }
}
