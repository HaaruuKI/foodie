// ignore_for_file: non_constant_identifier_names

import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/details/widget/text_description.dart';
import 'package:foodie/ui/pages/details/widget/text_name.dart';
import 'package:foodie/ui/pages/details/widget/text_price.dart';
import 'package:foodie/ui/widget/rating_bar_widget.dart';

class arcWidget extends StatelessWidget {
  const arcWidget({
    super.key,
    required this.price,
    required this.name,
    required this.des,
  });
  final int? price;
  final String? name;
  final String? des;

  @override
  Widget build(BuildContext context) {
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
                  ratingBarWidget(),
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
}
