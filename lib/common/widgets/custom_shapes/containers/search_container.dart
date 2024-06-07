import 'package:iconsax/iconsax.dart'; // Importing custom icons package.
import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Importing custom size constants for the app.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants for the app.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Importing helper functions.

/// A custom search container widget.
class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    this.onTap,
    required this.text,
    this.showBorder = true,
    this.showBackground = true,
    this.icon = Iconsax.search_normal,
    this.padding = const EdgeInsets.symmetric(horizontal: ADSizes.defaultSpace),
  });

  final String text; // The text displayed in the container.
  final IconData icon; // The icon displayed in the container.
  final VoidCallback? onTap; // Callback function when the container is tapped.
  final EdgeInsetsGeometry padding; // The padding around the container.
  final bool showBackground, showBorder; // Whether to show the container background and border.

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context); // Determine if the app is in dark mode.

    return GestureDetector(
      onTap: onTap, // Set the tap callback function.
      child: Padding(
        padding: padding, // Set the padding around the container.
        child: Container(
          width: HelperFunctions.screenWidth(), // Set the width of the container.
          padding: const EdgeInsets.all(ADSizes.md), // Set the internal padding of the container.
          decoration: BoxDecoration(
            color: showBackground ? (dark ? ADColors.dark : ADColors.light) : Colors.transparent, // Set the background color of the container.
            borderRadius: BorderRadius.circular(ADSizes.cardRadiusLg), // Set the border radius of the container.
            border: showBorder ? Border.all(color: ADColors.grey) : null, // Set the border of the container.
          ),
          child: Row(
            children: [
              Icon(icon, color: ADColors.darkerGrey), // Display the icon in the container.
              const SizedBox(width: ADSizes.spaceBtwItems), // Add horizontal space between the icon and text.
              Text(text, style: Theme.of(context).textTheme.bodySmall), // Display the text in the container.
            ],
          ),
        ),
      ),
    );
  }
}
