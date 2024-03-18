import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/images/rounded_image.dart';
import 'package:ebazaar/common/widgets/texts/product_title_text.dart';
import 'package:ebazaar/common/widgets/texts/brand_title_with_verified_icon.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// Image
        RoundedImage(
          imageUrl: ADImages.productImages[index],
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(ADSizes.sm),
          backgroundColor: dark ? ADColors.darkerGrey : ADColors.light,
        ),
        const SizedBox(width: ADSizes.spaceBtwItems),

        /// Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleWithVerifiedIcon(title: "Nike"),
              const Flexible(child: ProductTitleText(title: "Qora Sport Oyoqkiyimi", maxLines: 1)),

              /// Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Color ", style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: "Green ", style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: "Size ", style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: "UZ 43 ", style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
