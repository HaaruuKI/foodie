// ignore_for_file: file_names, use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, library_private_types_in_public_api, unnecessary_import

import 'package:flutter/cupertino.dart';

class text_date extends StatelessWidget {
  const text_date({
    super.key,
    required this.timestamp,
  });

  final int? timestamp;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Fecha: ${DateTime.fromMicrosecondsSinceEpoch(timestamp!).toString()}',
      style: TextStyle(fontSize: 16),
    );
  }
}
