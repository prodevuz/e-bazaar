import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/common/styles/shadows.dart';
import 'package:ebazaar/utils/constants/enums.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/common/widgets/icons/circular_icon.dart';
import 'package:ebazaar/common/widgets/images/rounded_image.dart';
import 'package:ebazaar/common/widgets/texts/product_price_text.dart';
import 'package:ebazaar/common/widgets/texts/product_title_text.dart';
import 'package:ebazaar/features/shop/controllers/products/product_controller.dart';
import 'package:ebazaar/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:ebazaar/features/shop/screens/product_details/product_detail.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(ADSizes.productImageRadius),
          color: dark ? ADColors.darkerGrey : ADColors.white,
        ),
        child: Column(children: [
          /// Thumbnail Image
          RoundedContainer(
            height: 180,
            width: 180,
            padding: const EdgeInsets.all(ADSizes.sm),
            backgroundColor: dark ? ADColors.dark : ADColors.light,
            child: Stack(children: [
              /// Thumbnail Image
              Center(
                child: RoundedImage(
                  imageUrl: product.thumbnail,
                  applyImageRadius: true,
                  backgroundColor: dark ? ADColors.dark : ADColors.light,
                  isNetworkImage: true,
                ),
              ),

              /// Sale Tag
              Positioned(
                top: 12,
                left: 0,
                child: RoundedContainer(
                  radius: ADSizes.sm,
                  backgroundColor: ADColors.secondary.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(horizontal: ADSizes.sm, vertical: ADSizes.xs),
                  child: Text("$salePercentage%", style: Theme.of(context).textTheme.labelLarge!.apply(color: ADColors.black)),
                ),
              ),

              /// Favorite Button
              const Positioned(
                top: 0,
                right: 0,
                child: CircularIcon(icon: Iconsax.heart5, color: Colors.red),
              ),
            ]),
          ),
          const SizedBox(height: ADSizes.spaceBtwItems / 2),

          /// Details
          Padding(
            padding: const EdgeInsets.only(left: ADSizes.sm),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              /// Title
              ProductTitleText(title: product.title, smallSize: true),
              const SizedBox(height: ADSizes.spaceBtwItems / 2),

              /// Brand
              BrandTitleWithVerifiedIcon(title: product.brand!.name),
            ]),
          ),

          const Spacer(),

          /// Price Row
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            /// Price
            Flexible(
              child: Column(
                children: [
                  if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: ADSizes.sm),
                      child: Text(
                        product.price.toString(),
                        style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: ADSizes.sm),
                    child: ProductPriceText(price: controller.getProductPrice(product), isLarge: true),
                  ),
                ],
              ),
            ),

            /// Add to Cart Button
            Container(
              decoration: const BoxDecoration(
                color: ADColors.dark,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ADSizes.cardRadiusMd),
                  bottomRight: Radius.circular(ADSizes.productImageRadius),
                ),
              ),
              child: const SizedBox(
                width: ADSizes.iconLg * 1.2,
                height: ADSizes.iconLg * 1.2,
                child: Center(child: Icon(Iconsax.add, color: ADColors.white)),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
