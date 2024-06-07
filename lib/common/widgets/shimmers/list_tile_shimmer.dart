import 'package:flutter/widgets.dart'; // Flutter widgets library.
import 'package:ebazaar/common/widgets/shimmers/shimmer.dart'; // Widget for displaying shimmer effects.
import 'package:ebazaar/utils/constants/sizes.dart'; // Custom size constants for the app.

class ADListTileShimmer extends StatelessWidget {
  const ADListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    /// Column to arrange shimmer effects vertically.
    return const Column(
      children: [
        /// Row to arrange shimmer effects horizontally.
        Row(
          children: [
            ADShimmerEffect(width: 50, height: 50, radius: 50), // Shimmer effect for the circular image.
            SizedBox(width: ADSizes.spaceBtwItems), // Add space between the image and text.
            /// Column to arrange text shimmer effects vertically.
            Column(
              children: [
                ADShimmerEffect(width: 100, height: 15), // Shimmer effect for the title text.
                SizedBox(height: ADSizes.spaceBtwItems / 2), // Add space between title and subtitle.
                ADShimmerEffect(width: 80, height: 12), // Shimmer effect for the subtitle text.
              ],
            ),
          ],
        ),
      ],
    );
  }
}
