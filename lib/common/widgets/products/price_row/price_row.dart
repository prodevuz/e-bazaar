import 'package:flutter/material.dart'; // Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Custom size constants for the app.
import 'package:ebazaar/features/shop/models/product_model.dart'; // Model for product data.
import 'package:ebazaar/common/widgets/texts/product_price_text.dart'; // Widget for displaying product prices.
import 'package:ebazaar/common/widgets/products/cart/add_to_cart_button.dart'; // Widget for adding products to cart.
import 'package:ebazaar/features/shop/controllers/products/product_controller.dart'; // Controller for managing product data.

class ProductPriceRow extends StatelessWidget {
  const ProductPriceRow({super.key, required this.product});

  final ProductModel product; // The product for which the price row is displayed.

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance; // Get the instance of the product controller.
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      /// Price
      Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left: ADSizes.sm), // Apply left padding.
          child: ProductPriceText(price: controller.getProductPrice(product), isLarge: true), // Display the product price.
        ),
      ),

      /// Add to Cart Button
      ProductCardAddToCartButton(product: product), // Widget for adding the product to cart.
    ]);
  }
}
