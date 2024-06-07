import 'package:iconsax/iconsax.dart'; // Package for custom icons.
import 'package:flutter/material.dart'; // Flutter material package for UI components.
import 'package:ebazaar/utils/constants/colors.dart'; // Custom color constants for the app.
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Package for displaying rating bars.

class ADRatingBarIndicator extends StatelessWidget {
  const ADRatingBarIndicator({super.key, required this.rating});

  final double rating; // The rating value.

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      // Widget for displaying a rating bar indicator.
      rating: rating, // Set the rating value.
      itemSize: 20, // Set the size of each rating item.
      unratedColor: ADColors.grey, // Set the color for unrated items.
      itemBuilder: (_, __) => const Icon(Iconsax.star1, color: ADColors.primary), // Builder function for creating each rating item.
    );
  }
}
