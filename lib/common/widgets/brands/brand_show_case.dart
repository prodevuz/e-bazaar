import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/brands/brand_card.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({super.key, this.brand = "Nike", required this.images});

  final String brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return RoundedContainer(
      showBorder: true,
      borderColor: ADColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(ADSizes.md),
      margin: const EdgeInsets.only(bottom: ADSizes.spaceBtwItems),
      child: Column(children: [
        /// Brand with Products Count
        BrandCard(name: brand, showBorder: false),
        const SizedBox(height: ADSizes.spaceBtwItems),

        /// Brand Top 3 Product Images
        Row(children: images.map((image) => brandTopProductImageWidget(image, dark)).toList()),
      ]),
    );
  }

  Widget brandTopProductImageWidget(String image, bool dark) {
    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: dark ? ADColors.darkerGrey : ADColors.light,
        margin: const EdgeInsets.only(right: ADSizes.sm),
        padding: const EdgeInsets.all(ADSizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
