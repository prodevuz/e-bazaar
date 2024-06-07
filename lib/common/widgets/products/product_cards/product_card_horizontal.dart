import 'package:flutter/material.dart'; // Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Custom size constants for the app.
import 'package:ebazaar/utils/constants/colors.dart'; // Custom color constants for the app.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Helper functions for common tasks.
import 'package:ebazaar/features/shop/models/product_model.dart'; // Model for product data.
import 'package:ebazaar/common/widgets/images/rounded_image.dart'; // Widget for displaying rounded images.
import 'package:ebazaar/common/widgets/texts/product_title_text.dart'; // Widget for displaying product titles.
import 'package:ebazaar/common/widgets/products/price_row/price_row.dart'; // Widget for displaying product price row.
import 'package:ebazaar/common/widgets/texts/brand_title_with_verified_icon.dart'; // Widget for displaying brand titles with verified icon.
import 'package:ebazaar/features/shop/controllers/products/product_controller.dart'; // Controller for managing product data.
import 'package:ebazaar/common/widgets/products/favourite_icon/favourite_icon.dart'; // Widget for displaying favourite icon.
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart'; // Widget for displaying rounded containers.

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key, required this.product});

  final ProductModel product; // The product data.

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context); // Check if dark mode is enabled.

    final controller = ProductController.instance; // Get the instance of the product controller.
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice); // Calculate the sale percentage.

    return Container(
      width: 310, // Set the width of the container.
      padding: const EdgeInsets.all(1), // Apply padding to the container.
      decoration: BoxDecoration(
        color: dark ? ADColors.darkerGrey : ADColors.softGrey, // Set the background color based on dark mode.
        borderRadius: BorderRadius.circular(ADSizes.productImageRadius), // Apply border radius to the container.
      ),
      child: Row(children: [
        RoundedContainer(
          height: 120, // Set the height of the rounded container.
          padding: const EdgeInsets.all(ADSizes.sm), // Apply padding to the rounded container.
          backgroundColor: dark ? ADColors.dark : ADColors.white, // Set the background color based on dark mode.
          child: Stack(children: [
            SizedBox(
              height: 120, // Set the height of the image.
              width: 120, // Set the width of the image.
              child: RoundedImage(
                isNetworkImage: true, // Specify if the image is loaded from network.
                applyImageRadius: true, // Apply border radius to the image.
                imageUrl: product.thumbnail, // Set the image URL.
                backgroundColor: ADColors.white, // Set the background color of the image.
              ),
            ),
            if (salePercentage != null) // If sale percentage is available, display it.
              Positioned(
                top: 12, // Set the position from the top.
                child: RoundedContainer(
                  radius: ADSizes.sm, // Set the border radius of the container.
                  backgroundColor: ADColors.secondary.withOpacity(0.8), // Set the background color of the container.
                  padding: const EdgeInsets.symmetric(horizontal: ADSizes.sm, vertical: ADSizes.xs), // Apply padding to the container.
                  child: Text(
                    salePercentage, // Display the sale percentage.
                    style: Theme.of(context).textTheme.labelLarge!.apply(color: ADColors.black), // Apply text style.
                  ),
                ),
              ),
            Positioned(top: 0, right: 0, child: ADFavouriteIcon(productId: product.id)), // Position the favourite icon.
          ]),
        ),
        SizedBox(
          width: 172, // Set the width of the container.
          child: Padding(
            padding: const EdgeInsets.only(top: ADSizes.sm, left: ADSizes.sm), // Apply padding to the container.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start.
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ProductTitleText(title: product.title, smallSize: true), // Display the product title.
                  SizedBox(height: ADSizes.spaceBtwItems / 2), // Add space between items.
                  BrandTitleWithVerifiedIcon(title: product.brand!.name), // Display the brand title with verified icon.
                ]),
                const Spacer(), // Add a spacer.
                ProductPriceRow(product: product), // Display the product price row.
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
