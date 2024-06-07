import 'package:get/get.dart'; // Package for state management and navigation.
import 'package:flutter/material.dart'; // Flutter material package for UI components.
import 'package:ebazaar/common/styles/shadows.dart'; // Custom shadow styles for widgets.
import 'package:ebazaar/utils/constants/sizes.dart'; // Custom size constants for the app.
import 'package:ebazaar/utils/constants/colors.dart'; // Custom color constants for the app.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Helper functions for common tasks.
import 'package:ebazaar/features/shop/models/product_model.dart'; // Model for product data.
import 'package:ebazaar/common/widgets/images/rounded_image.dart'; // Widget for displaying rounded images.
import 'package:ebazaar/common/widgets/texts/product_title_text.dart'; // Widget for displaying product titles.
import 'package:ebazaar/common/widgets/products/price_row/price_row.dart'; // Widget for displaying product price row.
import 'package:ebazaar/common/widgets/texts/brand_title_with_verified_icon.dart'; // Widget for displaying brand titles with verified icon.
import 'package:ebazaar/features/shop/screens/product_details/product_detail.dart'; // Screen for displaying product details.
import 'package:ebazaar/features/shop/controllers/products/product_controller.dart'; // Controller for managing product data.
import 'package:ebazaar/common/widgets/products/favourite_icon/favourite_icon.dart'; // Widget for displaying favourite icon.
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart'; // Widget for displaying rounded containers.

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});

  final ProductModel product; // The product data.

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context); // Check if dark mode is enabled.

    final controller = ProductController.instance; // Get the instance of the product controller.
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice); // Calculate the sale percentage.

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)), // Navigate to product details screen on tap.
      child: Container(
        width: 180, // Set the width of the container.
        padding: const EdgeInsets.all(1), // Apply padding to the container.
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow], // Apply box shadow.
          color: dark ? ADColors.darkerGrey : ADColors.white, // Set the background color based on dark mode.
          borderRadius: BorderRadius.circular(ADSizes.productImageRadius), // Apply border radius to the container.
        ),
        child: Column(children: [
          RoundedContainer(
            width: 180, // Set the width of the rounded container.
            height: 180, // Set the height of the rounded container.
            backgroundColor: dark ? ADColors.dark : ADColors.light, // Set the background color based on dark mode.
            child: Stack(children: [
              Center(
                child: RoundedImage(
                  isNetworkImage: true, // Specify if the image is loaded from network.
                  applyImageRadius: true, // Apply border radius to the image.
                  imageUrl: product.thumbnail, // Set the image URL.
                  backgroundColor: dark ? ADColors.dark : ADColors.light, // Set the background color of the image.
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(ADSizes.sm), // Apply padding to the child widget.
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children to the start and end.
                  children: [
                    if (salePercentage != null) // If sale percentage is available, display it.
                      RoundedContainer(
                        radius: ADSizes.sm, // Set the border radius of the container.
                        backgroundColor: ADColors.secondary.withOpacity(0.8), // Set the background color of the container.
                        padding: const EdgeInsets.symmetric(horizontal: ADSizes.sm, vertical: ADSizes.xs), // Apply padding to the container.
                        child: Text(
                          "$salePercentage%", // Display the sale percentage.
                          style: Theme.of(context).textTheme.labelLarge!.apply(color: ADColors.black), // Apply text style.
                        ),
                      ),
                    const Spacer(), // Add a spacer.
                    ADFavouriteIcon(productId: product.id), // Display the favourite icon.
                  ],
                ),
              ),
            ]),
          ),
          const SizedBox(height: ADSizes.spaceBtwItems / 2), // Add space between items.
          Padding(
            padding: const EdgeInsets.only(left: ADSizes.sm), // Apply padding to the child widget.
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ProductTitleText(title: product.title, smallSize: true, maxLines: 1), // Display the product title.
              const SizedBox(height: ADSizes.spaceBtwItems / 2), // Add space between items.
              BrandTitleWithVerifiedIcon(title: product.brand!.name), // Display the brand title with verified icon.
            ]),
          ),
          const Spacer(), // Add a spacer.
          ProductPriceRow(product: product), // Display the product price row.
        ]),
      ),
    );
  }
}
