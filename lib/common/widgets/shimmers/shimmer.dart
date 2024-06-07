import 'package:shimmer/shimmer.dart'; // Shimmer package for creating shimmer effects.
import 'package:flutter/material.dart'; // Flutter material package for UI components.
import 'package:ebazaar/utils/constants/colors.dart'; // Custom color constants for the app.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Helper functions for common tasks.

class ADShimmerEffect extends StatelessWidget {
  const ADShimmerEffect({super.key, required this.width, required this.height, this.radius = 15, this.color});

  final Color? color;
  final double width, height, radius;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context); // Check if dark mode is enabled.
    return Shimmer.fromColors(
      // Shimmer effect with animated color transition.
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!, // Base color for the shimmer effect.
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!, // Highlight color for the shimmer effect.
      child: Container(
        // Container to display the shimmer effect.
        width: width, // Set the width of the container.
        height: height, // Set the height of the container.
        decoration: BoxDecoration(
          // BoxDecoration for styling the container.
          borderRadius: BorderRadius.circular(radius), // Set the border radius for rounded corners.
          color: color ?? (dark ? ADColors.darkerGrey : ADColors.white), // Set the background color of the container.
        ),
      ),
    );
  }
}
