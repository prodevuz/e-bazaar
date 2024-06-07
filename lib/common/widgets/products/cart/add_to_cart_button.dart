import 'package:get/get.dart'; // Importing the Get package for state management.
import 'package:iconsax/iconsax.dart'; // Importing the iconsax package.
import 'package:flutter/material.dart'; // Importing the Flutter material package.
import 'package:ebazaar/utils/constants/enums.dart'; // Importing custom enums.
import 'package:ebazaar/utils/constants/sizes.dart'; // Importing custom size constants.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants.
import 'package:ebazaar/features/shop/models/product_model.dart'; // Importing the product model.
import 'package:ebazaar/features/shop/controllers/products/cart_controller.dart'; // Importing the cart controller.
import 'package:ebazaar/features/shop/screens/product_details/product_detail.dart'; // Importing the product detail screen.

/// Widget for adding a product to the cart.
class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({super.key, required this.product});

  final ProductModel product; // The product to be added to the cart.

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance; // Get the cart controller instance.

    return GestureDetector(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          // Check if the product is single.
          final cartItem = cartController.convertToCartItem(product, 1); // Convert the product to a cart item.
          cartController.addOneToCart(cartItem); // Add the product to the cart.
        } else {
          Get.to(() => ProductDetailScreen(product: product)); // Navigate to the product detail screen.
        }
      },
      child: Obx(
        () {
          final productQuantityInCart = cartController.getProductQuantityInCart(product.id); // Get the quantity of the product in the cart.

          return Container(
            decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? ADColors.primary : ADColors.dark, // Set the background color based on whether the product is in the cart.
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ADSizes.cardRadiusMd),
                bottomRight: Radius.circular(ADSizes.productImageRadius),
              ),
            ),
            child: SizedBox(
              width: ADSizes.iconLg * 1.2, // Set the width of the container.
              height: ADSizes.iconLg * 1.2, // Set the height of the container.
              child: Center(
                child: productQuantityInCart > 0 // Check if the product is in the cart.
                    ? Text(
                        productQuantityInCart.toString(), // Display the quantity of the product in the cart.
                        style: Theme.of(context).textTheme.bodyLarge!.apply(color: ADColors.white), // Apply text style.
                      )
                    : const Icon(Iconsax.add, color: ADColors.white), // Display the add icon if the product is not in the cart.
              ),
            ),
          );
        },
      ),
    );
  }
}
