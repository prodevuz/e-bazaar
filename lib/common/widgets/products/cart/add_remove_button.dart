import 'package:iconsax/iconsax.dart'; // Importing the iconsax package.
import 'package:flutter/material.dart'; // Importing the Flutter material package.
import 'package:ebazaar/utils/constants/sizes.dart'; // Importing custom size constants.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Importing helper functions.
import 'package:ebazaar/common/widgets/icons/circular_icon.dart'; // Importing CircularIcon widget.

/// Widget for displaying product quantity with add and remove buttons.
class ProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddRemoveButton({super.key, required this.quantity, this.add, this.remove});

  final int quantity; // The quantity of the product.
  final VoidCallback? add, remove; // Callback functions for add and remove buttons.

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context); // Check if dark mode is enabled.

    return Row(mainAxisSize: MainAxisSize.min, children: [
      /// Circular icon for removing quantity.
      CircularIcon(
        width: 32,
        height: 32,
        size: ADSizes.md,
        onPressed: remove, // Callback function for removing quantity.
        icon: Iconsax.minus, // Icon for removing quantity.
        color: dark ? ADColors.white : ADColors.black, // Icon color.
        backgroundColor: dark ? ADColors.darkerGrey : ADColors.light, // Background color of the icon.
      ),
      const SizedBox(width: ADSizes.spaceBtwItems), // SizedBox for spacing.
      Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall), // Text displaying the quantity.
      const SizedBox(width: ADSizes.spaceBtwItems), // SizedBox for spacing.
      /// Circular icon for adding quantity.
      CircularIcon(
        width: 32,
        height: 32,
        onPressed: add, // Callback function for adding quantity.
        size: ADSizes.md,
        icon: Iconsax.add, // Icon for adding quantity.
        color: ADColors.white, // Icon color.
        backgroundColor: ADColors.primary, // Background color of the icon.
      ),
    ]);
  }
}
