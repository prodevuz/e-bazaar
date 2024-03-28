import 'package:flutter/material.dart';
import 'package:ebazaar/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class CurvedEdgeWidget extends StatelessWidget {
  const CurvedEdgeWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) => ClipPath(clipper: ADCurvedEdges(), child: child);
}
