// ignore_for_file: file_names, use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, library_private_types_in_public_api, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/ui/colors.dart';
import 'package:foodie/ui/widget/btn_back.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OrderQRPage extends StatefulWidget {
  @override
  _OrderQRPageState createState() => _OrderQRPageState();
}

class _OrderQRPageState extends State<OrderQRPage> {
  String? key;
  List products = [];
  int? totalPrice;
  int? timestamp;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    key = args['key'];
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
              Text(
                'QR',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              QrImageView(
                data: key ?? '',
                version: QrVersions.auto,
                size: 320,
                gapless: false,
                embeddedImage: AssetImage('assets/my-Logo.png'),
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: Size(150, 150),
                ),
              ),
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
                      Text(
                        key ?? '',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Productos:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: products
                            .map<Widget>(
                              (product) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  children: [
                                    Text(
                                      '${product['name']} - ${product['quantity']} C/unidad - ${product['price'].toStringAsFixed(2)}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Fecha: ${DateTime.fromMicrosecondsSinceEpoch(timestamp!).toString()}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Total: \$${totalPrice!.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
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
