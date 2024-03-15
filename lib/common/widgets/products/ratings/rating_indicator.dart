import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ADRatingBarIndicator extends StatelessWidget {
  const ADRatingBarIndicator({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: ADColors.grey,
      itemBuilder: (_, __) => const Icon(Iconsax.star1, color: ADColors.primary),
    );
  }
}
