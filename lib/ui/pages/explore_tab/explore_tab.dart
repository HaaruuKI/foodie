// ignore_for_file: library_private_types_in_public_api, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodie/domain/entities/log_in.dart';
import 'package:foodie/ui/pages/categories/categories.dart';
import 'package:foodie/ui/pages/more/more_page.dart';
import 'package:foodie/ui/pages/popular/popular_page.dart';
import 'package:foodie/ui/widget/btn_cart.dart';
import 'package:foodie/ui/widget/money_foodie_page.dart';
// import 'package:foodie/ui/widget/credits.dart';
import 'package:foodie/ui/widget/search.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  _ExploreTabState createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  @override
  Widget build(BuildContext context) {
    final isUserLoggedIn = LogIn.user != null && LogIn.user != null;

    return Scaffold(
      appBar: isUserLoggedIn
          ? AppBar(
              title: const FoodieMoney(),
              centerTitle: false,
            )
          : null,
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            children: [
              Search(),
              Categories(),
              PopularPage(),
              MorePage(),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
      floatingActionButton: const BtnCart(),
    );
  }
}
