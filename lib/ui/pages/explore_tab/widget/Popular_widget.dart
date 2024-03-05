// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class PopularesItemWidget extends StatefulWidget {
  const PopularesItemWidget({super.key});

  @override
  _PopularesItemWidgetState createState() => _PopularesItemWidgetState();
}

class _PopularesItemWidgetState extends State<PopularesItemWidget> {
  Future<List<Widget>> _getPopularItems() async {
    // Fetch popular items from API or database
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getPopularItems(),
      builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: snapshot.data!,
            ),
          );
        }
      },
    );
  }
}
