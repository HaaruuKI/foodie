// ignore_for_file: file_names, use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, library_private_types_in_public_api, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:qr_flutter/qr_flutter.dart';

class qrWidget extends StatelessWidget {
  const qrWidget({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: id ?? '',
      version: QrVersions.auto,
      size: 320,
      gapless: false,
      embeddedImage: AssetImage('assets/my-Logo.png'),
      embeddedImageStyle: QrEmbeddedImageStyle(
        size: Size(150, 150),
      ),
    );
  }
}
