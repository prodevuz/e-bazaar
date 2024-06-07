import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants for the app.

/// A custom circular container widget.
class CircularContainer extends StatelessWidget {
  const CircularContainer({super.key, this.width = 400, this.height = 400, this.radius = 400, this.margin, this.padding = 0, this.child, this.backgroundColor = ADColors.white});

  final double? width; // The width of the container.
  final double? height; // The height of the container.
  final double radius; // The radius of the container's corners.
  final Widget? child; // The child widget inside the container.
  final double padding; // The padding inside the container.
  final EdgeInsets? margin; // The margin around the container.
  final Color backgroundColor; // The background color of the container.

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Set the width of the container.
      height: height, // Set the height of the container.
      margin: margin, // Set the margin around the container.
      padding: EdgeInsets.all(padding), // Set the padding inside the container.
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius), color: backgroundColor), // Set the container's decoration with rounded corners and background color.
      child: child, // Set the child widget inside the container.
    );
  }
}
