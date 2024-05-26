import 'package:flutter/material.dart';
import 'package:ebazaar/common/widgets/shimmers/shimmer.dart';

class ADBrandsShowcaseShimmer extends StatelessWidget {
  const ADBrandsShowcaseShimmer({super.key});

  @override
  Widget build(BuildContext context) {
  
    return const ADShimmerEffect(width: double.infinity, height: 300);
  }
}
