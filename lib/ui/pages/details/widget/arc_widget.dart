// ignore_for_file: non_constant_identifier_names

import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/details/widget/rating_bar.dart';
import 'package:foodie/ui/pages/details/widget/text_description.dart';
import 'package:foodie/ui/pages/details/widget/text_name.dart';
import 'package:foodie/ui/pages/details/widget/text_price.dart';

Widget ArcWidget(int? price, String? name, String? des) {
  return Arc(
    edge: Edge.TOP,
    arcType: ArcType.CONVEY,
    height: 30,
    child: Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingBarWidget(),
                TextPrice(price),
              ],
            ),
          ),
          TextName(name),
          TextDescription(des),
        ],
      ),
    ),
  );
}
