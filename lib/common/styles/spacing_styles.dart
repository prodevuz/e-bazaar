import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Importing custom size constants for the app.

/// A class to define different spacing styles used in the app.
class ADSpacingStyles {
  // Padding style with space for the app bar height.
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: ADSizes.appBarHeight, // Top padding equal to the app bar height.
    left: ADSizes.defaultSpace, // Left padding with the default space value.
    bottom: ADSizes.defaultSpace, // Bottom padding with the default space value.
    right: ADSizes.defaultSpace, // Right padding with the default space value.
  );
}
