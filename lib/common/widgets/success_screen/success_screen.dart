import 'package:flutter/material.dart'; // Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Custom size constants for the app.
import 'package:ebazaar/common/styles/spacing_styles.dart'; // Spacing styles for consistent padding.
import 'package:ebazaar/utils/constants/text_strings.dart'; // Constant strings used in the app.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Helper functions for common tasks.

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  final VoidCallback onPressed; // Callback function for button press.
  final String image, title, subTitle; // Image path, title, and subtitle.

  @override
  Widget build(BuildContext context) {
    /// Scaffold for providing the app's basic layout structure.
    return Scaffold(
      /// SingleChildScrollView to make the content scrollable.
      body: SingleChildScrollView(
        /// Padding widget for adding space around the content.
        child: Padding(
          padding: ADSpacingStyles.paddingWithAppBarHeight * 2, // Padding based on spacing styles.
          /// Column for arranging widgets vertically.
          child: Column(children: [
            Image(image: AssetImage(image), width: HelperFunctions.screenWidth() * 0.6), // Display success image.
            const SizedBox(height: ADSizes.spaceBtwSections), // Add space between widgets.
            Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center), // Display title.
            const SizedBox(height: ADSizes.spaceBtwItems), // Add space between widgets.
            Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center), // Display subtitle.
            const SizedBox(height: ADSizes.spaceBtwSections), // Add space between widgets.
            /// SizedBox to constrain button width.
            SizedBox(
              width: double.infinity, // Make button fill the available width.
              /// ElevatedButton for the continue button.
              child: ElevatedButton(
                onPressed: onPressed, // Assign onPressed callback.
                child: const Text(ADTexts.cContinue), // Text for the button.
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
