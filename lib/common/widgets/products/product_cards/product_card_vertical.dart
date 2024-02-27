import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ebazaar/common/styles/shadows.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/icons/circular_icon.dart';
import 'package:ebazaar/common/widgets/images/rounded_image.dart';
import 'package:ebazaar/common/widgets/texts/product_price_text.dart';
import 'package:ebazaar/common/widgets/texts/product_title_text.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(boxShadow: [ShadowStyle.verticalProductShadow], borderRadius: BorderRadius.circular(ADSizes.productImageRadius), color: dark ? ADColors.darkerGrey : ADColors.white),
        child: Column(
          children: [
            /// Thumbnail Image
            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(ADSizes.sm),
              backgroundColor: dark ? ADColors.dark : ADColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  const RoundedImage(imageUrl: ADImages.deliveredEmailIllustration, applyImageRadius: true), // productImage1

                  /// Sole Tag
                  Positioned(top: 12, child: RoundedContainer(radius: ADSizes.sm, backgroundColor: ADColors.secondary.withOpacity(0.8), padding: const EdgeInsets.symmetric(horizontal: ADSizes.sm, vertical: ADSizes.xs), child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: ADColors.black)))),

                  /// Favorite Button
                  const Positioned(top: 0, right: 0, child: CircularIcon(icon: Iconsax.heart5, color: Colors.red)),
                ],
              ),
            ),
            const SizedBox(height: ADSizes.spaceBtwItems / 2),

            /// Details
            Padding(
              padding: const EdgeInsets.only(left: ADSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  const ProductTitleText(title: 'Green Nike Air Shoes', smallSize: true),
                  const SizedBox(height: ADSizes.spaceBtwItems / 2),

                  /// Brand
                  Row(
                    children: [
                      Text('Nike', overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(width: ADSizes.xs),
                      const Icon(Iconsax.verify5, color: ADColors.primary, size: ADSizes.iconXs),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: ADSizes.sm),
                  child: ProductPriceText(price: '35.5', isLarge: true),
                ),
                Container(decoration: const BoxDecoration(color: ADColors.dark, borderRadius: BorderRadius.only(topLeft: Radius.circular(ADSizes.cardRadiusMd), bottomRight: Radius.circular(ADSizes.productImageRadius))), child: const SizedBox(width: ADSizes.iconLg * 1.2, height: ADSizes.iconLg * 1.2, child: Center(child: Icon(Iconsax.add, color: ADColors.white)))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
