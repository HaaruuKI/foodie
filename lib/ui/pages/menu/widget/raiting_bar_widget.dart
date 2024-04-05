import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodie/ui/colors.dart';

Widget raitingBarWidget() {
  return RatingBar.builder(
    initialRating: 5,
    minRating: 1,
    direction: Axis.horizontal,
    itemCount: 5,
    itemSize: 18,
    itemPadding: const EdgeInsets.symmetric(horizontal: 4),
    itemBuilder: (context, _) => const Icon(Icons.star, color: amarillo),
    onRatingUpdate: (index) {},
  );
}
