import 'package:flutter/material.dart'; // Importing the Flutter material package.
import 'package:ebazaar/utils/constants/sizes.dart'; // Importing custom size constants.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants.
import 'package:ebazaar/utils/constants/image_strings.dart'; // Importing image asset paths.
import 'package:ebazaar/features/authentication/controllers/login/login_controller.dart'; // Importing the login controller.

/// Widget for displaying social login buttons.
class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key}); // Constructor for the SocialButtons widget.

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance; // Instance of the login controller.

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: ADColors.grey), // Border color of the container.
          borderRadius: BorderRadius.circular(100), // Border radius of the container.
        ),
        child: IconButton(
          onPressed: () => controller.googleSignIn(), // Function to handle Google sign-in.
          icon: const Image(
            width: ADSizes.iconMd, // Width of the Google icon.
            height: ADSizes.iconMd, // Height of the Google icon.
            image: AssetImage(ADImages.google), // Image asset for the Google icon.
          ),
        ),
      ),
      const SizedBox(width: ADSizes.spaceBtwItems), // SizedBox for spacing between buttons.
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: ADColors.grey), // Border color of the container.
          borderRadius: BorderRadius.circular(100), // Border radius of the container.
        ),
        child: IconButton(
          onPressed: () {}, // Placeholder function for Facebook sign-in.
          icon: const Image(
            width: ADSizes.iconMd, // Width of the Facebook icon.
            height: ADSizes.iconMd, // Height of the Facebook icon.
            image: AssetImage(ADImages.facebook), // Image asset for the Facebook icon.
          ),
        ),
      ),
    ]);
  }
}
