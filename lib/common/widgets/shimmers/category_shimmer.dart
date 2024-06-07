import 'package:flutter/widgets.dart'; // Flutter widgets library for building UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Custom size constants for the app.
import 'package:ebazaar/common/widgets/shimmers/shimmer.dart'; // Widget for displaying shimmer effects.

class ADCategoryShimmer extends StatelessWidget {
  const ADCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount; // Number of shimmer items to display.

  @override
  Widget build(BuildContext context) {
    /// Use SizedBox to constrain the height of the shimmer effect.
    return SizedBox(
      height: 80, // Height of each shimmer item.
      /// Use ListView.separated to create a horizontal list with separators.
      child: ListView.separated(
        shrinkWrap: true, // Allow the ListView to wrap its content.
        itemCount: itemCount, // Total number of shimmer items.
        scrollDirection: Axis.horizontal, // Display items in a horizontal direction.
        separatorBuilder: (_, __) => const SizedBox(width: ADSizes.spaceBtwItems), // Separator between items.
        itemBuilder: (_, __) {
          /// Each shimmer item is wrapped in a Column for vertical alignment.
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start (left) of the column.
            children: [
              ADShimmerEffect(width: 55, height: 55, radius: 55), // Shimmer effect for category image.
              SizedBox(height: ADSizes.spaceBtwItems / 2), // Add space between image and text.
              ADShimmerEffect(width: 55, height: 8), // Shimmer effect for category name.
            ],
          );
        },
      ),
    );
  }
}
