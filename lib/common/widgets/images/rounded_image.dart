import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Importing custom size constants for the app.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants for the app.
import 'package:ebazaar/common/widgets/shimmers/shimmer.dart'; // Importing shimmer effect widget.
import 'package:cached_network_image/cached_network_image.dart'; // Importing cached network image package.

/// A rounded image widget.
class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.overlayColor,
    this.height = 200,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.width = double.infinity,
    this.applyImageRadius = true,
    this.borderRadius = ADSizes.md,
    this.backgroundColor = ADColors.light,
  });

  final BoxFit fit; // The fit of the image.
  final String imageUrl; // The image URL or asset path.
  final BoxBorder? border; // The border of the container.
  final double borderRadius; // The border radius of the container.
  final bool isNetworkImage; // Whether the image is fetched from network or local.
  final Color? overlayColor; // The color overlay on the image.
  final double width, height; // The width and height of the container.
  final bool applyImageRadius; // Whether to apply border radius to the image.
  final Color backgroundColor; // The background color of the container.
  final VoidCallback? onPressed; // The callback function when the image is pressed.
  final EdgeInsetsGeometry? padding; // The padding of the container.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Attach the onPressed callback to the GestureDetector.
      child: Container(
        width: width, // Set the width of the container.
        height: height, // Set the height of the container.
        padding: padding, // Apply padding to the container.
        decoration: BoxDecoration(
          border: border, // Apply border to the container.
          color: backgroundColor, // Set the background color of the container.
          borderRadius: BorderRadius.circular(borderRadius), // Apply border radius to the container.
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero, // Apply border radius to the image.
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit, // Set the fit of the image.
                  imageUrl: imageUrl, // Set the image URL.
                  color: overlayColor, // Set the color overlay on the image.
                  progressIndicatorBuilder: (context, url, downloadProgress) => ADShimmerEffect(width: width, height: height), // Display shimmer effect while image is loading.
                  errorWidget: (context, url, error) => const Icon(Icons.error), // Display error icon if image loading fails.
                )
              : Image(fit: fit, color: overlayColor, image: AssetImage(imageUrl)), // Display local image otherwise.
        ),
      ),
    );
  }
}
