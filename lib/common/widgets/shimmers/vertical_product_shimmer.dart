import 'package:flutter/material.dart'; // Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Custom size constants for the app.
import 'package:ebazaar/common/widgets/shimmers/shimmer.dart'; // Shimmer effect widget.
import 'package:ebazaar/common/widgets/layouts/grid_layout.dart'; // Grid layout widget for displaying items.

class ADVerticalProductShimmer extends StatelessWidget {
  const ADVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    /// GridLayout to arrange shimmer effects in a grid layout.
    return GridLayout(
      itemCount: itemCount, // Number of shimmer effects to display.
      /// SizedBox to define fixed dimensions for each shimmer effect.
      itemBuilder: (_, __) => const SizedBox(
        width: 180, // Width of the SizedBox to constrain the width of the shimmer effect.
        /// Column to display shimmer effects vertically.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align shimmer effects to the start of the column.
          children: [
            ADShimmerEffect(width: 180, height: 180), // Shimmer effect for product image.
            SizedBox(height: ADSizes.spaceBtwItems), // Add space between shimmer effects.
            ADShimmerEffect(width: 160, height: 15), // Shimmer effect for product title.
            SizedBox(height: ADSizes.spaceBtwItems / 2), // Add half space between shimmer effects.
            ADShimmerEffect(width: 110, height: 15), // Shimmer effect for product details.
          ],
        ),
      ),
    );
  }
}
