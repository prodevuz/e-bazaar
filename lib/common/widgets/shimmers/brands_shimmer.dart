import 'package:flutter/material.dart';
import 'package:ebazaar/common/widgets/shimmers/shimmer.dart';
import 'package:ebazaar/common/widgets/layouts/grid_layout.dart';

class ADBrandsShimmer extends StatelessWidget {
  const ADBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const ADShimmerEffect(width: 300, height: 80),
    );
  }
}
