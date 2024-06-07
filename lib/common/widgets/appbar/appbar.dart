import 'package:get/get.dart'; // Importing GetX package for state management.
import 'package:iconsax/iconsax.dart'; // Importing Iconsax package for custom icons.
import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Importing custom size constants for the app.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants for the app.
import 'package:ebazaar/utils/device/device_utility.dart'; // Importing device utility functions.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Importing helper functions.

/// A custom app bar widget with optional title, actions, and leading icon.
class ADAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ADAppBar({
    super.key,
    this.title,
    this.actions,
    this.arrowColor,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
  });

  final Widget? title; // The title widget of the app bar.
  final Color? arrowColor; // The color of the back arrow icon.
  final bool showBackArrow; // Whether to show the back arrow icon.
  final IconData? leadingIcon; // The leading icon of the app bar.
  final List<Widget>? actions; // The list of action widgets.
  final VoidCallback? leadingOnPressed; // The callback function for the leading icon.

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context); // Determine if the app is in dark mode.

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ADSizes.md), // Horizontal padding for the app bar.
      child: AppBar(
        title: title, // Set the title of the app bar.
        actions: actions, // Set the actions of the app bar.
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(), // Navigate back when the back arrow is pressed.
                icon: Icon(
                  Iconsax.arrow_left,
                  color: arrowColor ?? (dark ? ADColors.white : ADColors.dark), // Set the color of the back arrow.
                ),
              )
            : leadingIcon != null
                ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) // Set the leading icon if provided.
                : null,
        automaticallyImplyLeading: false, // Do not automatically imply a leading widget.
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ADDeviceUtils.getAppBarHeight()); // Set the preferred size of the app bar.
}
