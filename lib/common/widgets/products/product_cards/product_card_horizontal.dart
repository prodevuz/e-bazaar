import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/common/widgets/images/rounded_image.dart';
import 'package:ebazaar/common/widgets/texts/product_title_text.dart';
import 'package:ebazaar/common/widgets/products/price_row/price_row.dart';
import 'package:ebazaar/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:ebazaar/features/shop/controllers/products/product_controller.dart';
import 'package:ebazaar/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ADSizes.productImageRadius),
          color: dark ? ADColors.darkerGrey : ADColors.softGrey),
      child: Row(children: [
        /// Thumbnail
        RoundedContainer(
          height: 120,
          padding: const EdgeInsets.all(ADSizes.sm),
          backgroundColor: dark ? ADColors.dark : ADColors.white,
          child: Stack(children: [
            /// Thumbnail Image
            SizedBox(
              height: 120,
              width: 120,
              child: RoundedImage(
                isNetworkImage: true,
                applyImageRadius: true,
                imageUrl: product.thumbnail,
                backgroundColor: ADColors.white,
              ),
            ),

            /// Sale Tag
            if (salePercentage != null)
              Positioned(
                top: 12,
                child: RoundedContainer(
                  radius: ADSizes.sm,
                  backgroundColor: ADColors.secondary.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(horizontal: ADSizes.sm, vertical: ADSizes.xs),
                  child: Text(
                    salePercentage,
                    style: Theme.of(context).textTheme.labelLarge!.apply(color: ADColors.black),
                  ),
                ),
              ),

            /// Favorite Button
            Positioned(top: 0, right: 0, child: ADFavouriteIcon(productId: product.id)),
          ]),
        ),

        /// Details
        SizedBox(
          width: 172,
          child: Padding(
            padding: const EdgeInsets.only(top: ADSizes.sm, left: ADSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ProductTitleText(title: product.title, smallSize: true),
                  SizedBox(height: ADSizes.spaceBtwItems / 2),
                  BrandTitleWithVerifiedIcon(title: product.brand!.name),
                ]),

                const Spacer(),

                /// Price Row
                ProductPriceRow(product: product),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
