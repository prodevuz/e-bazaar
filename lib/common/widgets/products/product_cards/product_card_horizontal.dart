import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/icons/circular_icon.dart';
import 'package:ebazaar/common/widgets/images/rounded_image.dart';
import 'package:ebazaar/common/widgets/texts/product_price_text.dart';
import 'package:ebazaar/common/widgets/texts/product_title_text.dart';
import 'package:ebazaar/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ADSizes.productImageRadius),
        color: dark ? ADColors.darkerGrey : ADColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          RoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(ADSizes.sm),
            backgroundColor: dark ? ADColors.dark : ADColors.white,
            child: Stack(
              children: [
                /// Thumbnail Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: RoundedImage(imageUrl: ADImages.productImage1, applyImageRadius: true, backgroundColor: ADColors.white),
                ),

                /// Sale Tag
                Positioned(
                  top: 12,
                  child: RoundedContainer(
                    radius: ADSizes.sm,
                    backgroundColor: ADColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: ADSizes.sm, vertical: ADSizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context).textTheme.labelLarge!.apply(color: ADColors.black),
                    ),
                  ),
                ),

                /// Favorite Button
                const Positioned(top: 0, right: 0, child: CircularIcon(icon: Iconsax.heart5, color: Colors.red)),
              ],
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: ADSizes.sm, left: ADSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(title: "Yashil Nike yarim yenglik ko'ylak", smallSize: true),
                      SizedBox(height: ADSizes.spaceBtwItems / 2),
                      BrandTitleWithVerifiedIcon(title: "Nike"),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      const Flexible(child: ProductPriceText(price: "256.0")),

                      /// Add to cart
                      Container(
                        decoration: const BoxDecoration(
                          color: ADColors.dark,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(ADSizes.cardRadiusMd), bottomRight: Radius.circular(ADSizes.productImageRadius)),
                        ),
                        child: const SizedBox(
                          width: ADSizes.iconLg * 1.2,
                          height: ADSizes.iconLg * 1.2,
                          child: Center(child: Icon(Iconsax.add, color: ADColors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
