// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MoreWidget extends StatefulWidget {
  const MoreWidget({super.key});

  @override
  _MoreWidgetState createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {
  Future<List<Widget>> _getNewetsItems() async {
    // Fetch newest items from API or database
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getNewetsItems(),
      builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Column(
            children: snapshot.data!,
          );
        }
      },
    );
  }
}
