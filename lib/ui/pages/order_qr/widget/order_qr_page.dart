// ignore_for_file: file_names, use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, library_private_types_in_public_api, unnecessary_import

import 'package:flutter/cupertino.dart';

class text_qr extends StatelessWidget {
  const text_qr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'QR',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
