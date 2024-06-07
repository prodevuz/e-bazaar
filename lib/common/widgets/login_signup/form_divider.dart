import 'package:flutter/material.dart'; // Importing the Flutter material package.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Importing helper functions.

/// A divider widget with text in the center.
class FormDivider extends StatelessWidget {
  const FormDivider({super.key, required this.dividerText}); // Constructor with required dividerText parameter.

  final String dividerText; // Text to display in the center of the divider.

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context); // Checking if dark mode is enabled.

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Flexible(
        child: Divider(
          indent: 60, // Indent on the left side of the divider.
          endIndent: 5, // End indent on the left side of the divider.
          thickness: 0.5, // Thickness of the divider line.
          color: dark ? ADColors.darkGrey : ADColors.grey, // Color of the divider line based on the theme.
        ),
      ),
      Text(dividerText, style: Theme.of(context).textTheme.labelMedium), // Text displayed in the center of the divider.
      Flexible(
        child: Divider(
          indent: 5, // Indent on the right side of the divider.
          endIndent: 60, // End indent on the right side of the divider.
          thickness: 0.5, // Thickness of the divider line.
          color: dark ? ADColors.darkGrey : ADColors.grey, // Color of the divider line based on the theme.
        ),
      ),
    ]);
  }
}
