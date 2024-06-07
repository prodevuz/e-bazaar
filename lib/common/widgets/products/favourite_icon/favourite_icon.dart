import 'package:get/get.dart'; // Import the Get package for state management.
import 'package:iconsax/iconsax.dart'; // Import the Iconsax package for icon fonts.
import 'package:flutter/material.dart'; // Flutter material package for UI components.
import 'package:ebazaar/utils/constants/colors.dart'; // Custom color constants for the app.
import 'package:ebazaar/common/widgets/icons/circular_icon.dart'; // Widget for displaying circular icons.
import 'package:ebazaar/features/shop/controllers/products/favourite_controller.dart'; // Favourite controller for managing favourite products.

class ADFavouriteIcon extends StatelessWidget {
  const ADFavouriteIcon({super.key, required this.productId});

  final String productId; // The ID of the product associated with the favourite icon.

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance; // Get the instance of the favourite controller.

    /// Circular icon widget wrapped in an observer for reactive updates.
    return Obx(() => CircularIcon(
          onPressed: () => controller.toggleFavouriteProduct(productId), // Callback function to toggle the favourite status of the product.
          color: controller.isFavourite(productId) ? ADColors.error : null, // Set the color of the icon based on the favourite status.
          icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart, // Set the icon based on the favourite status.
        ));
  }
}
