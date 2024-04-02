// ignore_for_file: file_names, use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/ui/pages/details/widget/arc_widget.dart';
import 'package:foodie/ui/pages/details/widget/container_bar.dart';
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
      bottomNavigationBar: LogIn.user != null
          ? ContainerBar(name!, price!, img!, context)
          : null,
    );
  }
}
