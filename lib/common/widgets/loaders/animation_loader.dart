import 'package:lottie/lottie.dart'; // Importing the Lottie package for animations.
import 'package:flutter/material.dart'; // Importing the Flutter material package.
import 'package:ebazaar/utils/constants/sizes.dart'; // Importing custom size constants.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants.

/// A widget for displaying an animation loader with optional action button.
class AnimationLoaderWidget extends StatelessWidget {
  const AnimationLoaderWidget({
    super.key,
    this.actionText, // Text for the action button.
    required this.text, // Text to display below the animation.
    this.onActionPressed, // Callback function for the action button.
    required this.animation, // Path to the animation asset.
    this.showAction = false, // Whether to show the action button.
  });

  final String text; // Text to display below the animation.
  final String animation; // Path to the animation asset.
  final bool showAction; // Whether to show the action button.
  final String? actionText; // Text for the action button.
  final VoidCallback? onActionPressed; // Callback function for the action button.

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // Lottie animation widget.
        Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8, fit: BoxFit.contain),
        const SizedBox(height: ADSizes.defaultSpace), // Spacer.
        // Text below the animation.
        Text(text, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
        const SizedBox(height: ADSizes.defaultSpace), // Spacer.
        // Action button if showAction is true.
        showAction
            ? SizedBox(
                width: 250,
                child: OutlinedButton(
                  onPressed: onActionPressed, // Callback function for button press.
                  style: OutlinedButton.styleFrom(backgroundColor: ADColors.dark), // Button style.
                  child: Text(actionText!, style: Theme.of(context).textTheme.bodyMedium!.apply(color: ADColors.light)), // Button text.
                ),
              )
            : const SizedBox() // Empty SizedBox if showAction is false.
      ]),
    );
  }
}
