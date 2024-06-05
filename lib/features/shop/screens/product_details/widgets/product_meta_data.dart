import 'package:ebazaar/utils/logging/logger.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/enums.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/common/widgets/images/circular_image.dart';
import 'package:ebazaar/common/widgets/texts/product_price_text.dart';
import 'package:ebazaar/common/widgets/texts/product_title_text.dart';
import 'package:ebazaar/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:ebazaar/features/shop/controllers/products/product_controller.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);

    LoggerHelper.warning(product.brand!.image);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      /// Price $ Sale Price
      Row(children: [
        /// Sale Tag
        RoundedContainer(
          radius: ADSizes.sm,
          backgroundColor: ADColors.secondary.withOpacity(0.8),
          padding: const EdgeInsets.symmetric(horizontal: ADSizes.sm, vertical: ADSizes.xs),
          child: Text(
            '$salePercentage%',
            style: Theme.of(context).textTheme.labelLarge!.apply(color: ADColors.black),
          ),
        ),
        const SizedBox(width: ADSizes.spaceBtwItems),

        /// Price
        if (product.productType == ProductType.single.toString() && product.salePrice > 0)
          Text(
            '\$${product.price}',
            style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
          ),
        if (product.productType == ProductType.single.toString() && product.salePrice > 0)
          const SizedBox(width: ADSizes.spaceBtwItems),
        ProductPriceText(price: controller.getProductPrice(product), isLarge: true),
      ]),
      const SizedBox(height: ADSizes.spaceBtwItems / 1.5),

      /// Title
      ProductTitleText(title: product.title),
      const SizedBox(height: ADSizes.spaceBtwItems / 1.5),

      /// Stock Status
      Row(children: [
        const ProductTitleText(title: "Holat"),
        const SizedBox(width: ADSizes.spaceBtwItems),
        Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium),
      ]),
      const SizedBox(height: ADSizes.spaceBtwItems / 1.5),

      /// Brand
      Row(children: [
        CircularImage(
          width: 32,
          height: 32,
          isNetworkImage: true,
          image: product.brand != null ? product.brand!.image : '',
          overlayColor: dark ? ADColors.white : ADColors.black,
        ),
        BrandTitleWithVerifiedIcon(
          title: product.brand != null ? product.brand!.name : '',
          brandTextSize: TextSizes.medium,
        ),
      ])
    ]);
  }
}
