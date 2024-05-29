import 'package:ebazaar/common/widgets/shimmers/shimmer.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:flutter/widgets.dart';

class ADBoxesShimmer extends StatelessWidget {
  const ADBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: ADShimmerEffect(width: 150, height: 110)),
            SizedBox(width: ADSizes.spaceBtwItems),
            Expanded(child: ADShimmerEffect(width: 150, height: 110)),
            SizedBox(width: ADSizes.spaceBtwItems),
            Expanded(child: ADShimmerEffect(width: 150, height: 110)),
          ],
        ),
      ],
    );
  }
}
