import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Importing custom size constants for the app.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants for the app.

/// A custom rounded container widget.
class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.showBorder = false,
    this.radius = ADSizes.cardRadiusLg,
    this.backgroundColor = ADColors.white,
    this.borderColor = ADColors.borderPrimary,
  });

  final double? width; // The width of the container.
  final double? height; // The height of the container.
  final double radius; // The radius of the container's corners.
  final Widget? child; // The child widget inside the container.
  final bool showBorder; // Whether to show the border around the container.
  final Color borderColor; // The color of the container's border.
  final Color backgroundColor; // The background color of the container.
  final EdgeInsetsGeometry? padding; // The padding inside the container.
  final EdgeInsetsGeometry? margin; // The margin around the container.

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Set the width of the container.
      height: height, // Set the height of the container.
      margin: margin, // Set the margin around the container.
      padding: padding, // Set the padding inside the container.
      decoration: BoxDecoration(
        color: backgroundColor, // Set the background color of the container.
        borderRadius: BorderRadius.circular(radius), // Set the radius of the container's corners.
        border: showBorder ? Border.all(color: borderColor) : null, // Set the container's border if showBorder is true.
      ),
      child: child, // Set the child widget inside the container.
    );
  }
}
