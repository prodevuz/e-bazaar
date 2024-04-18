import 'package:ebazaar/common/widgets/shimmers/shimmer.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:flutter/widgets.dart';

class ADCategoryShimmer extends StatelessWidget {
  const ADCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: ADSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              ADShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: ADSizes.spaceBtwItems / 2),

              /// Text
              ADShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
