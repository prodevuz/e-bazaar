import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.

/// A custom clipper for creating curved edges.
class ADCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height); // Start at the bottom-left corner.

    final firstCurve = Offset(0, size.height - 20); // Define the first control point of the first curve.
    final lastCurve = Offset(30, size.height - 20); // Define the end point of the first curve.

    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy); // Draw the first curve.

    final secondFirstCurve = Offset(0, size.height - 20); // Define the start point of the second curve.
    final secondLastCurve = Offset(size.width - 30, size.height - 20); // Define the end point of the second curve.

    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy, secondLastCurve.dx, secondLastCurve.dy); // Draw the second curve.

    final thirdFirstCurve = Offset(size.width, size.height - 20); // Define the start point of the third curve.
    final thirdLastCurve = Offset(size.width, size.height); // Define the end point of the third curve.

    path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy, thirdLastCurve.dx, thirdLastCurve.dy); // Draw the third curve.

    path.lineTo(size.width, 0); // Draw a line to the top-right corner.
    path.close(); // Close the path to form a closed shape.
    return path; // Return the path.
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true; // Always recalculate the clip path.
}
