// ignore_for_file: library_private_types_in_public_api, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodie/ui/pages/categories/categories_page.dart';
import 'package:foodie/ui/pages/more_product/more_page.dart';
import 'package:foodie/ui/pages/popular_product/popular_page.dart';
import 'package:foodie/ui/widget/btn_cart.dart';
import 'package:foodie/ui/widget/search.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  _ExploreTabState createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            children: [
              Search(),
              CategoriesPage(),
              PopularPage(),
              MorePage(),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
      floatingActionButton: BtnCart(),
    );
  }
}
