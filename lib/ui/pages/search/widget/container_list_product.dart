// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, file_names, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie/domain/entities/navigator/navigate_to.dart';

class containerListProduct extends StatelessWidget {
  const containerListProduct({
    super.key,
    required List<DocumentSnapshot<Object?>> results,
  }) : _results = results;

  final List<DocumentSnapshot<Object?>> _results;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _results.length,
        itemBuilder: (context, index) {
          final name = _results[index]['name'];
          final price = _results[index]['price'];
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  NavigateTo.details(context, _results, index);
                },
                child: ListTile(
                  title: Text(
                    name[0].toUpperCase() + name.substring(1),
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    '\$ $price',
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: Text(
                    'mas detalles',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Divider()
            ],
          );
        },
      ),
    );
  }
}
