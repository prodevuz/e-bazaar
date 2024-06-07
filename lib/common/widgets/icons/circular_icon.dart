import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Importing custom size constants for the app.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants for the app.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Importing helper functions.

/// A circular icon button widget.
class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    this.color,
    this.width,
    this.height,
    this.onPressed,
    required this.icon,
    this.backgroundColor,
    this.size = ADSizes.lg,
  });

  final Color? color; // The color of the icon.
  final IconData icon; // The icon to be displayed.
  final Color? backgroundColor; // The background color of the circular icon.
  final VoidCallback? onPressed; // Callback function when the icon is pressed.
  final double? width, height, size; // The width, height, and size of the circular icon.

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context); // Determine if the app is in dark mode.

    return Container(
      width: width, // Set the width of the container.
      height: height, // Set the height of the container.
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100), // Set the border radius to make the container circular.
        color: backgroundColor != null // Set the background color of the container based on the provided value or the app's theme.
            ? backgroundColor!
            : dark
                ? ADColors.black.withOpacity(0.9)
                : ADColors.white.withOpacity(0.9),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: color, size: size)), // Display the icon button.
    );
  }
}
