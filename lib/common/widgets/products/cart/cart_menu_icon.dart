import 'package:get/get.dart'; // Importing the Get package for navigation.
import 'package:iconsax/iconsax.dart'; // Importing the Iconsax package for icons.
import 'package:flutter/material.dart'; // Importing the Flutter material package for UI components.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants for the app.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Importing helper functions for common tasks.
import 'package:ebazaar/features/shop/screens/cart/cart.dart'; // Importing the CartScreen widget.
import 'package:ebazaar/features/shop/controllers/products/cart_controller.dart'; // Importing the CartController.

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  final Color? iconColor; // Color of the shopping bag icon.
  final Color? counterBgColor; // Background color of the item counter.
  final Color? counterTextColor; // Text color of the item counter.

  @override
  Widget build(BuildContext context) {
    final bool dark = HelperFunctions.isDarkMode(context); // Check if dark mode is enabled.
    final CartController controller = CartController.instance; // Get an instance of the CartController.

    // Display a shopping bag icon with a counter indicating the number of items in the cart.
    return Stack(
      children: [
        // Shopping bag icon button that navigates to the CartScreen when pressed.
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()), // Navigate to the CartScreen when pressed.
          icon: Icon(Iconsax.shopping_bag, color: iconColor), // Display the shopping bag icon with the specified color.
        ),
        Positioned(
          // Position the counter container to the top right corner of the shopping bag icon.
          right: 0,
          // Container to display the counter.
          child: Container(
            width: 18, // Width of the counter container.
            height: 18, // Height of the counter container.
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), // Apply circular border radius to the container.
              color: counterBgColor ?? (dark ? ADColors.white : ADColors.black), // Set the background color of the counter container.
            ),
            child: Center(
              // Center the counter text vertically and horizontally.
              child: Obx(
                // Obx widget updates the UI when the value of noOfCartItems changes.
                () => Text(
                  controller.noOfCartItems.value.toString(), // Display the number of items in the cart.
                  // Apply the specified text style to the counter text.
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                        fontSizeFactor: 0.8, // Reduce the font size of the counter text.
                        color: counterTextColor ?? (dark ? ADColors.black : ADColors.white), // Set the text color of the counter.
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
