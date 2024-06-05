import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/common/widgets/texts/product_price_text.dart';
import 'package:ebazaar/common/widgets/products/cart/add_to_cart_button.dart';
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
      ProductCardAddToCartButton(product: product),
    ]);
  }
}
