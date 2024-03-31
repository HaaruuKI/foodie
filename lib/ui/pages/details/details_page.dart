// ignore_for_file: file_names, use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/domain/entities/add_to_shopping_cart.dart';
import 'package:foodie/domain/entities/snack_bar_send_data.dart';
import 'package:foodie/ui/colors.dart';
import 'package:foodie/ui/pages/details/widget/arc_widget.dart';
import 'package:foodie/ui/pages/details/widget/image_widget.dart';
import 'package:foodie/ui/widget/btn_back.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String? name;
  int? price;
  String? img;
  String? des;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    name = args['name'];
    price = args['price'];
    img = args['img'];
    des = args['des'];
  }

  @override
  void initState() {
    super.initState();
    LogIn().GetCurrentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            BtnBack(context),
            ImageWidget(img),
            ArcWidget(price, name, des),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 70,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              Text(
                'Total:',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                '\$ ${price ?? ''}',
                style: TextStyle(
                    fontSize: 19, fontWeight: FontWeight.bold, color: amarillo),
              ),
            ]),
            ElevatedButton.icon(
              onPressed: () {
                if (LogIn.user != null) {
                  SendDataToRealtime.EnviarDatosRealtimeDatabase(
                      name!, price!, img!);
                  ShowSnackBars.ShowSnackbar(context, name!);
                } else {
                  Navigator.pushNamed(context, 'profile');
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(amarillo),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              icon: Icon(CupertinoIcons.cart),
              label: Text(
                'Agregar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
