// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/search/function_search.dart';
import 'package:foodie/ui/pages/search/widget/container_list_product.dart';
import 'package:foodie/ui/widget/button_back.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<DocumentSnapshot> _results = [];

  void resultsSetState(querySnapshot) {
    setState(() {
      _results = querySnapshot.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buttonBack(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 15,
            ),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.search,
                      color: Color.fromARGB(255, 243, 164, 16),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          autofocus: true,
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Buscar...',
                            border: InputBorder.none,
                          ),
                          onChanged: (text) {
                            FunctionSearch.searchFirestore(
                                resultsSetState, text.toLowerCase());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          containerListProduct(results: _results),
        ],
      ),
    );
  }
}
