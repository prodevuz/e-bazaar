import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebazaar/common/widgets/shimmers/shimmer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/brands/brand_card.dart';
import 'package:ebazaar/features/shop/models/brand_model.dart';
import 'package:ebazaar/features/shop/screens/brands/brand_products.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({super.key, required this.brand, required this.images});

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: RoundedContainer(
        showBorder: true,
        borderColor: ADColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(ADSizes.md),
        margin: const EdgeInsets.only(bottom: ADSizes.spaceBtwItems),
        child: Column(children: [
          /// Brand with Products Count
          BrandCard(brand: brand, showBorder: false),
          const SizedBox(height: ADSizes.spaceBtwItems),

          /// Brand Top 3 Product Images
          Row(
            children: images.map((image) {
              return Expanded(
                child: RoundedContainer(
                  height: 100,
                  padding: const EdgeInsets.all(ADSizes.md),
                  margin: const EdgeInsets.only(right: ADSizes.sm),
                  backgroundColor: dark ? ADColors.darkerGrey : ADColors.light,
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    progressIndicatorBuilder: (context, url, downloadProgress) => const ADShimmerEffect(width: 100, height: 100),
                  ),
                ),
              );
            }).toList(),
          ),
        ]),
      ),
    );
  }
}
