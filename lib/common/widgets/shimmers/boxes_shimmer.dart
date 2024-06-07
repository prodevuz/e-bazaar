import 'package:flutter/widgets.dart'; // Flutter widgets package for building UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Custom size constants for the app.
import 'package:ebazaar/common/widgets/shimmers/shimmer.dart'; // Widget for displaying shimmer effects.

class ADBoxesShimmer extends StatelessWidget {
  const ADBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    /// Column widget to arrange shimmer effects vertically.
    return const Column(
      children: [
        /// Row widget to arrange shimmer effects horizontally.
        Row(
          children: [
            Expanded(child: ADShimmerEffect(width: 150, height: 110)), // Shimmer effect for the first box.
            SizedBox(width: ADSizes.spaceBtwItems), // Add space between boxes.
            Expanded(child: ADShimmerEffect(width: 150, height: 110)), // Shimmer effect for the second box.
            SizedBox(width: ADSizes.spaceBtwItems), // Add space between boxes.
            Expanded(child: ADShimmerEffect(width: 150, height: 110)), // Shimmer effect for the third box.
          ],
        ),
      ],
    );
  }
}
