import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/enums.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/images/circular_image.dart';
import 'package:ebazaar/common/widgets/texts/product_price_text.dart';
import 'package:ebazaar/common/widgets/texts/product_title_text.dart';
import 'package:ebazaar/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price $ Sale Price
        Row(
          children: [
            /// Sale Tag
            RoundedContainer(
              radius: ADSizes.sm,
              backgroundColor: ADColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: ADSizes.sm, vertical: ADSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: ADColors.black)),
            ),
            const SizedBox(width: ADSizes.spaceBtwItems),

            /// Price
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: ADSizes.spaceBtwItems),
            const ProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: ADSizes.spaceBtwItems / 1.5),

        /// Title
        const ProductTitleText(title: "Yashil Nike sport Krasovkasi"),
        const SizedBox(height: ADSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const ProductTitleText(title: "Holat"),
            const SizedBox(width: ADSizes.spaceBtwItems),
            Text("Sotuvda mavjud", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: ADSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            CircularImage(
              image: ADImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: dark ? ADColors.white : ADColors.black,
            ),
            const BrandTitleWithVerifiedIcon(title: "Nike", brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}
