import 'package:flutter/material.dart'; // Flutter material package for UI components.
import 'package:ebazaar/common/widgets/shimmers/shimmer.dart'; // Widget for displaying shimmer effects.
import 'package:ebazaar/common/widgets/layouts/grid_layout.dart'; // Custom grid layout widget.

class ADBrandsShimmer extends StatelessWidget {
  const ADBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount; // Number of shimmer items to display.

  @override
  Widget build(BuildContext context) {
    /// Use GridLayout widget to arrange shimmer items in a grid layout.
    return GridLayout(
      mainAxisExtent: 80, // Height of each grid item.
      itemCount: itemCount, // Total number of shimmer items.
      itemBuilder: (_, __) => const ADShimmerEffect(width: 300, height: 80), // Build each shimmer item.
    );
  }
}
