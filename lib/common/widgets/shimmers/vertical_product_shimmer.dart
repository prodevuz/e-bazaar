import 'package:ebazaar/common/widgets/layouts/grid_layout.dart';
import 'package:ebazaar/common/widgets/shimmers/shimmer.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ADVerticalProductShimmer extends StatelessWidget {
  const ADVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            ADShimmerEffect(width: 180, height: 180),
            SizedBox(height: ADSizes.spaceBtwItems),

            /// Text
            ADShimmerEffect(width: 160, height: 15),
            SizedBox(height: ADSizes.spaceBtwItems / 2),
            ADShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
