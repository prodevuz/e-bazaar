import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';

/// A reusable grid layout widget that displays items in a grid format.
class GridLayout extends StatelessWidget {
  /// The total number of items in the grid.
  final int itemCount;

  /// The extent of the main axis (height for vertical grid, width for horizontal grid).
  final double mainAxisExtent;

  /// A builder function that returns a widget for each item in the grid.
  final Widget? Function(BuildContext, int) itemBuilder;

  /// Constructs a GridLayout widget.
  const GridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 288, // Default main axis extent if not provided.
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Take up only the space required by the children.
      itemCount: itemCount, // Total number of items in the grid.
      itemBuilder: itemBuilder, // Builder function to generate each grid item.
      padding: EdgeInsets.zero, // No padding around the grid.
      physics: const NeverScrollableScrollPhysics(), // Disable scrolling for the grid.
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid.
        mainAxisExtent: mainAxisExtent, // Height of each grid item.
        mainAxisSpacing: ADSizes.gridViewSpacing, // Spacing between items along the main axis.
        crossAxisSpacing: ADSizes.gridViewSpacing, // Spacing between items along the cross axis.
      ),
    );
  }
}
