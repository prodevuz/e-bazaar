import 'package:ebazaar/common/widgets/shimmers/shimmer.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ADHorizontalProductShimmer extends StatelessWidget {
  const ADHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(bottom: ADSizes.spaceBtwSections),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: ADSizes.spaceBtwItems),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            ADShimmerEffect(width: 120, height: 120),
            SizedBox(width: ADSizes.spaceBtwItems),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: ADSizes.spaceBtwItems / 2),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
