// ignore_for_file: file_names, use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, library_private_types_in_public_api, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';

import 'package:foodie/ui/widget/button_back.dart';

import 'widget/order_qr_page.dart';
import 'widget/qr_widget.dart';
import 'widget/text_date.dart';
import 'widget/text_id.dart';
import 'widget/text_price.dart';
import 'widget/text_product_list.dart';
import 'widget/text_productos.dart';

class OrderQRPage extends StatefulWidget {
  @override
  _OrderQRPageState createState() => _OrderQRPageState();
}

class _OrderQRPageState extends State<OrderQRPage> {
  String? id;
  List products = [];
  int? totalPrice;
  int? timestamp;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    id = args['key'];
    products = args['products'];
    totalPrice = args['totalPrice'];
    timestamp = args['timestamp'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              btnBack(context),
              text_qr(),
              qrWidget(id: id),
              SizedBox(height: 25),
              Container(
                margin: EdgeInsetsDirectional.all(20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      textId(id: id),
                      SizedBox(height: 15),
                      textProductos(),
                      textProductList(products: products),
                      SizedBox(height: 15),
                      text_date(timestamp: timestamp),
                      textPrice(totalPrice: totalPrice),
                      SizedBox(height: 15),
                      Icon(
                        CupertinoIcons.checkmark_alt_circle,
                        color: verdeUTN,
                        size: 100,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
