import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/history_order/widget/total_price.dart';

Widget containerTotalPrice(double totalPrice) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
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
                  totalPriceWidget(totalPrice)
                ]),
          ),
        ],
      ),
    ),
  );
}
