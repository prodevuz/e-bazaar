import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/chips/choice_chips.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';
import 'package:ebazaar/common/widgets/texts/product_title_text.dart';
import 'package:ebazaar/common/widgets/texts/product_price_text.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Column(
      children: [
        /// Selected Attributes Pricing & Description
        RoundedContainer(
          padding: const EdgeInsets.all(ADSizes.md),
          backgroundColor: dark ? ADColors.darkerGrey : ADColors.grey,
          child: Column(
            children: [
              /// Title, Price & Stock Status
              Row(
                children: [
                  const SectionHeading(title: "Turlar", showActionButton: false),
                  const SizedBox(width: ADSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(title: "Narx : ", smallSize: true),

                          /// Actual Price
                          Text('\$25', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: ADSizes.spaceBtwItems),

                          /// Sale Price
                          const ProductPriceText(price: "20"),
                        ],
                      ),

                      /// Stack
                      Row(
                        children: [
                          const ProductTitleText(title: "Mavjudligi : ", smallSize: true),
                          Text("Sotuvda mavjud", style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation Description
              const ProductTitleText(title: "This is the description of the product and it can go up to max 4 lines", smallSize: true, maxLines: 4),
            ],
          ),
        ),
        const SizedBox(height: ADSizes.spaceBtwItems),

        /// Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: "Ranglar", showActionButton: false),
            const SizedBox(height: ADSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                ADChoiceChip(text: "Green", selected: true, onSelected: (value) {}),
                ADChoiceChip(text: "Red", selected: false, onSelected: (value) {}),
                ADChoiceChip(text: "Purple", selected: false, onSelected: (value) {}),
                ADChoiceChip(text: "Black", selected: false, onSelected: (value) {}),
                ADChoiceChip(text: "White", selected: false, onSelected: (value) {}),
                ADChoiceChip(text: "Grey", selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: "O'lchamlar", showActionButton: false),
            const SizedBox(height: ADSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                ADChoiceChip(text: "UZ 34", selected: true, onSelected: (value) {}),
                ADChoiceChip(text: "UZ 36", selected: false, onSelected: (value) {}),
                ADChoiceChip(text: "UZ 38", selected: false, onSelected: (value) {}),
                ADChoiceChip(text: "UZ 40", selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
