import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants for the app.

/// A class to define different shadow styles used in the app.
class ShadowStyle {
  // A shadow style for vertical product elements.
  static final verticalProductShadow = BoxShadow(
    blurRadius: 50, // The blur radius of the shadow.
    spreadRadius: 7, // The spread radius of the shadow.
    offset: const Offset(0, 2), // The position offset of the shadow.
    color: ADColors.darkGrey.withOpacity(0.1), // The color of the shadow with opacity.
  );

  // A shadow style for horizontal product elements.
  static final horizontalProductShadow = BoxShadow(
    blurRadius: 50, // The blur radius of the shadow.
    spreadRadius: 7, // The spread radius of the shadow.
    offset: const Offset(0, 2), // The position offset of the shadow.
    color: ADColors.darkGrey.withOpacity(0.1), // The color of the shadow with opacity.
  );
}
