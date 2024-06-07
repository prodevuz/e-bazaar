import 'package:get/get.dart'; // Importing GetX package for state management and navigation.
import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Importing custom size constants for the app.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants for the app.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Importing helper functions.
import 'package:ebazaar/common/widgets/shimmers/shimmer.dart'; // Importing shimmer effect widget.
import 'package:ebazaar/common/widgets/brands/brand_card.dart'; // Importing brand card widget.
import 'package:ebazaar/features/shop/models/brand_model.dart'; // Importing brand model.
import 'package:cached_network_image/cached_network_image.dart'; // Importing cached network image widget.
import 'package:ebazaar/features/shop/screens/brands/brand_products.dart'; // Importing brand products screen.
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart'; // Importing rounded container widget.

/// A custom widget to showcase a brand with its products.
class BrandShowcase extends StatelessWidget {
  const BrandShowcase({super.key, required this.brand, required this.images});

  final BrandModel brand; // The brand model containing brand data.
  final List<String> images; // List of image URLs for the brand's products.

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context); // Determine if the app is in dark mode.

    return GestureDetector(
      onTap: () => Get.to(() => BrandProducts(brand: brand)), // Navigate to brand products screen on tap.
      child: RoundedContainer(
        showBorder: true, // Show border around the container.
        borderColor: ADColors.darkGrey, // Set the border color.
        backgroundColor: Colors.transparent, // Set the background color to transparent.
        padding: const EdgeInsets.all(ADSizes.md), // Set padding inside the container.
        margin: const EdgeInsets.only(bottom: ADSizes.spaceBtwItems), // Set bottom margin.
        child: Column(
          children: [
            /// Brand with Products Count
            BrandCard(brand: brand, showBorder: false), // Display the brand card without border.
            const SizedBox(height: ADSizes.spaceBtwItems), // Add vertical space between elements.

            /// Brand Top 3 Product Images
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the row's children horizontally.
              children: images.map((image) {
                return RoundedContainer(
                  width: 100, // Set the width of the container.
                  height: 100, // Set the height of the container.
                  padding: const EdgeInsets.all(ADSizes.md), // Set padding inside the container.
                  margin: const EdgeInsets.only(right: ADSizes.sm), // Set right margin.
                  backgroundColor: dark ? ADColors.darkerGrey : ADColors.light, // Set background color based on theme.
                  child: CachedNetworkImage(
                    imageUrl: image, // Set the image URL.
                    fit: BoxFit.cover, // Set the fit type of the image.
                    errorWidget: (context, url, error) => const Icon(Icons.error), // Display error icon on image load failure.
                    progressIndicatorBuilder: (context, url, downloadProgress) => const ADShimmerEffect(width: 100, height: 100), // Display shimmer effect while loading.
                  ),
                );
              }).toList(), // Convert the images list to a list of widgets.
            ),
          ],
        ),
      ),
    );
  }
}
