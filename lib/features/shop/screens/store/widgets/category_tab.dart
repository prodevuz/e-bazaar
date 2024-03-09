import 'package:ebazaar/common/widgets/brands/brand_show_case.dart';
import 'package:ebazaar/common/widgets/layouts/grid_layout.dart';
import 'package:ebazaar/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              const BrandShowcase(images: [ADImages.onBoardingImage3, ADImages.onBoardingImage2, ADImages.onBoardingImage1]),
              const BrandShowcase(images: [ADImages.onBoardingImage3, ADImages.onBoardingImage2, ADImages.onBoardingImage1]),
              const SizedBox(height: ADSizes.spaceBtwItems),

              /// Products
              SectionHeading(title: "Sizga yoqishi mumkin", onPressed: () {}),
              const SizedBox(height: ADSizes.spaceBtwItems),

              GridLayout(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical()),
              const SizedBox(height: ADSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
