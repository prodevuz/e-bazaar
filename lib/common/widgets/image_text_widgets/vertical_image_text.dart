import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Importing custom size constants for the app.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants for the app.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Importing helper functions.
import 'package:cached_network_image/cached_network_image.dart'; // Importing cached network image package.

/// A widget displaying an image with text below it vertically.
class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    this.backgroundColor,
    this.isNetworkImage = true,
    this.textColor = ADColors.white,
  });

  final Color textColor; // The color of the text.
  final String image, title; // The image URL and title.
  final bool isNetworkImage; // Whether the image is fetched from network or local.
  final Color? backgroundColor; // The background color of the container.
  final void Function()? onTap; // Callback function when the widget is tapped.

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context); // Determine if the app is in dark mode.

    return GestureDetector(
      onTap: onTap, // Set the tap callback function.
      child: Padding(
        padding: const EdgeInsets.only(right: ADSizes.spaceBtwItems), // Apply right padding.
        child: Column(
          children: [
            Container(
              width: 56, // Set the width of the container.
              height: 56, // Set the height of the container.
              padding: const EdgeInsets.all(ADSizes.sm), // Apply padding to the container.
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), // Make the container circular.
                color: backgroundColor ?? (dark ? ADColors.black : ADColors.white), // Set the background color of the container.
              ),
              child: isNetworkImage
                  ? CachedNetworkImage(imageUrl: image, color: dark ? ADColors.light : ADColors.dark) // Display cached network image if it's a network image.
                  : Image(fit: BoxFit.cover, image: AssetImage(image), color: dark ? ADColors.light : ADColors.dark), // Display local image otherwise.
            ),
            const SizedBox(height: ADSizes.spaceBtwItems / 2), // Add space between image and text.
            SizedBox(
              width: 55, // Set the width of the text container.
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis, // Handle text overflow.
                style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor), // Apply text style.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
