import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants for the app.
import 'package:ebazaar/utils/device/device_utility.dart'; // Importing device utility functions.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Importing helper functions.

/// A custom tab bar widget with specified tabs.
class ADTabBar extends StatelessWidget implements PreferredSizeWidget {
  const ADTabBar({super.key, required this.tabs}); // Constructor to initialize the tabs.

  final List<Widget> tabs; // List of tab widgets to be displayed in the tab bar.

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context); // Determine if the app is in dark mode.

    return Material(
      color: dark ? ADColors.black : ADColors.white, // Set the background color based on the theme.
      child: TabBar(
        tabs: tabs, // Set the list of tabs.
        isScrollable: true, // Allow the tabs to be scrollable.
        indicatorColor: ADColors.primary, // Set the color of the tab indicator.
        unselectedLabelColor: ADColors.darkGrey, // Set the color for unselected tab labels.
        labelColor: dark ? ADColors.white : ADColors.primary, // Set the color for selected tab labels based on the theme.
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ADDeviceUtils.getAppBarHeight()); // Set the preferred size of the tab bar.
}
