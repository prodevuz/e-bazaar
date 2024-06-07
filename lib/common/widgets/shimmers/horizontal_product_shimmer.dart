import 'package:flutter/material.dart'; // Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Custom size constants for the app.
import 'package:ebazaar/common/widgets/shimmers/shimmer.dart'; // Widget for displaying shimmer effects.

class ADHorizontalProductShimmer extends StatelessWidget {
  const ADHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount; // Number of shimmer items to display.

  @override
  Widget build(BuildContext context) {
    /// Container to provide a height for the shimmer effect.
    return Container(
      height: 120, // Height of each shimmer item.
      margin: EdgeInsets.only(bottom: ADSizes.spaceBtwSections), // Margin at the bottom.
      /// ListView.separated to create a horizontal list with separators.
      child: ListView.separated(
        shrinkWrap: true, // Allow the ListView to wrap its content.
        itemCount: itemCount, // Total number of shimmer items.
        scrollDirection: Axis.horizontal, // Display items in a horizontal direction.
        separatorBuilder: (context, index) => SizedBox(width: ADSizes.spaceBtwItems), // Separator between items.
        /// Each shimmer item is wrapped in a Row for horizontal alignment.
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min, // Use the minimum size to wrap content.
          children: [
            ADShimmerEffect(width: 120, height: 120), // Shimmer effect for product image.
            SizedBox(width: ADSizes.spaceBtwItems), // Add space between image and text.
            /// Column to display product details vertically.
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start (left) of the column.
              mainAxisSize: MainAxisSize.min, // Use the minimum size to wrap content vertically.
              children: [
                SizedBox(width: ADSizes.spaceBtwItems / 2), // Add space between items.
              ],
            ),
          ],
        ),
      ),
    );
  }
}
