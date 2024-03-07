import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/menu/widget/menu_bebida_widget.dart';
import 'package:foodie/ui/widget/btn_back.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: btnBack(context),
      ),
      body: const MenuBebidaWidget(),
    );
  }
}
