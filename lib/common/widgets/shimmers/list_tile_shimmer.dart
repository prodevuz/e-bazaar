import 'package:ebazaar/common/widgets/shimmers/shimmer.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:flutter/widgets.dart';

class ADListTileShimmer extends StatelessWidget {
  const ADListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            ADShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: ADSizes.spaceBtwItems),
            Column(
              children: [
                ADShimmerEffect(width: 100, height: 15),
                SizedBox(height: ADSizes.spaceBtwItems / 2),
                ADShimmerEffect(width: 80, height: 12),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
