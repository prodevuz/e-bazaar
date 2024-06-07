import 'package:flutter/material.dart'; // Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Custom size constants for the app.
import 'package:ebazaar/utils/constants/colors.dart'; // Custom color constants for the app.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Helper functions for common tasks.
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart'; // Widget for displaying rounded containers.

class CouponCode extends StatelessWidget {
  const CouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context); // Check if dark mode is enabled.

    /// Rounded container widget for the coupon code input field and button.
    return RoundedContainer(
      showBorder: true, // Display border around the container.
      backgroundColor: dark ? ADColors.dark : ADColors.white, // Set background color based on dark mode.
      padding: const EdgeInsets.only(top: ADSizes.sm, right: ADSizes.sm, bottom: ADSizes.sm, left: ADSizes.md), // Apply padding to the container.
      /// Row containing the text field and button.
      child: Row(children: [
        /// Flexible widget to allow the text field to expand and fill available space.
        const Flexible(
          /// Text field for entering the coupon code.
          child: TextField(
            // Decoration for the text field.
            decoration: InputDecoration(
              border: InputBorder.none, // Remove border around the text field.
              errorBorder: InputBorder.none, // Remove error border.
              focusedBorder: InputBorder.none, // Remove focused border.
              enabledBorder: InputBorder.none, // Remove enabled border.
              disabledBorder: InputBorder.none, // Remove disabled border.
              hintText: "Promokod bormi? Bu yerga kiriting", // Hint text for the text field.
            ),
          ),
        ),

        // Button for applying the coupon code.
        SizedBox(
          width: 80, // Set the width of the button.
          // Elevated button widget.
          child: ElevatedButton(
            onPressed: () {}, // Callback function when the button is pressed.
            // Style settings for the button.
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.withOpacity(0.2), // Set button background color with opacity.
              side: BorderSide(color: Colors.grey.withOpacity(0.1)), // Set border color with opacity.
              foregroundColor: dark ? ADColors.white.withOpacity(0.5) : ADColors.dark.withOpacity(0.5), // Set text color based on dark mode with opacity.
            ),
            child: const Text("Qo'llash"), // Text displayed on the button.
          ),
        ),
      ]),
    );
  }
}
