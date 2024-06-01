import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/common/widgets/texts/product_price_text.dart';
import 'package:ebazaar/features/shop/controllers/products/product_controller.dart';

class ProductPriceRow extends StatelessWidget {
  const ProductPriceRow({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      /// Price
      Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left: ADSizes.sm),
          child: ProductPriceText(price: controller.getProductPrice(product), isLarge: true),
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
    ]);
  }
}
