// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget state(String state_order) {
  return Text(
    'Estado: $state_order',
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  );
}
