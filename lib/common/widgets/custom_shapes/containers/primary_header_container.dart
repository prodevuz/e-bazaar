import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants for the app.
import 'package:ebazaar/common/widgets/custom_shapes/containers/circular_container.dart'; // Importing circular container widget.
import 'package:ebazaar/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart'; // Importing curved edges widget.

/// A custom widget for the primary header container with curved edges.
class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key, required this.child});

  final Widget child; // The child widget inside the container.

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: ADColors.primary, // Set the background color of the container.
        child: Stack(
          children: [
            Positioned(
              top: -150, // Set the top position of the circular container.
              right: -250, // Set the right position of the circular container.
              child: CircularContainer(backgroundColor: ADColors.textWhite.withOpacity(0.1)), // Display circular container with specified background color.
            ),
            Positioned(
              top: 100, // Set the top position of the circular container.
              right: -300, // Set the right position of the circular container.
              child: CircularContainer(backgroundColor: ADColors.textWhite.withOpacity(0.1)), // Display circular container with specified background color.
            ),
            child, // Set the child widget inside the container.
          ],
        ),
      ),
    );
  }
}
