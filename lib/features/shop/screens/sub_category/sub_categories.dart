import 'package:ebazaar/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/common/widgets/images/rounded_image.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ADAppBar(title: Text("Sport Fudbolkalari"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const RoundedImage(width: double.infinity, imageUrl: ADImages.promoBanner3, applyImageRadius: true),
              const SizedBox(height: ADSizes.spaceBtwSections),

              /// Sub-Categories
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Heading
                  SectionHeading(title: "Sport fudbolkalari", onPressed: () {}),
                  const SizedBox(height: ADSizes.spaceBtwSections / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      separatorBuilder: (_, __)=> const SizedBox(width: ADSizes.spaceBtwItems),
                      itemBuilder: (context, index) => const ProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
