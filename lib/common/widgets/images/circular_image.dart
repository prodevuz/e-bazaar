import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Importing custom size constants for the app.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants for the app.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Importing helper functions.
import 'package:ebazaar/common/widgets/shimmers/shimmer.dart'; // Importing shimmer effect widget.
import 'package:cached_network_image/cached_network_image.dart'; // Importing cached network image package.

/// A circular image widget.
class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    required this.image,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.padding = ADSizes.sm,
    this.isNetworkImage = false,
  });

  final BoxFit fit; // The fit of the image.
  final String image; // The image URL or asset path.
  final bool isNetworkImage; // Whether the image is fetched from network or local.
  final Color? overlayColor; // The color overlay on the image.
  final Color? backgroundColor; // The background color of the container.
  final double width, height, padding; // The width, height, and padding of the container.

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context); // Determine if the app is in dark mode.

    return Container(
      width: width, // Set the width of the container.
      height: height, // Set the height of the container.
      padding: EdgeInsets.all(padding), // Apply padding to the container.
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? ADColors.black : ADColors.white), // Set the background color of the container.
        borderRadius: BorderRadius.circular(100), // Make the container circular.
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100), // Make the image circular.
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit, // Set the fit of the image.
                  imageUrl: image, // Set the image URL.
                  color: overlayColor, // Set the color overlay on the image.
                  errorWidget: (context, url, error) => const Icon(Icons.error), // Display error icon if image loading fails.
                  progressIndicatorBuilder: (context, url, downloadProgress) {
                    return const ADShimmerEffect(height: 55, width: 55); // Display shimmer effect while image is loading.
                  },
                )
              : Image(fit: fit, color: overlayColor, image: AssetImage(image)), // Display local image otherwise.
        ),
      ),
    );
  }
}
