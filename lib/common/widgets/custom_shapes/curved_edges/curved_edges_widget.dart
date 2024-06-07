import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:ebazaar/common/widgets/custom_shapes/curved_edges/curved_edges.dart'; // Importing curved edges clipper.

/// A custom widget for displaying curved edges.
class CurvedEdgeWidget extends StatelessWidget {
  const CurvedEdgeWidget({super.key, this.child});

  final Widget? child; // The child widget inside the curved edges.

  @override
  Widget build(BuildContext context) => ClipPath(clipper: ADCurvedEdges(), child: child); // Use ClipPath with curved edges clipper to clip the child widget.
}
