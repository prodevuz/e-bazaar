import 'package:flutter/material.dart'; // Flutter material package for UI components.

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    this.maxLines = 2, // Maximum number of lines before truncation.
    required this.title, // Product title text to display.
    this.smallSize = false, // Whether to use a small text size.
    this.textAlign = TextAlign.left, // Text alignment.
  });

  final int maxLines; // Maximum number of lines before truncation.
  final String title; // Product title text.
  final bool smallSize; // Whether to use a small text size.
  final TextAlign textAlign; // Text alignment.

  @override
  Widget build(BuildContext context) {
    return Text(
      title, // Display the product title text.
      maxLines: maxLines, // Set the maximum number of lines.
      textAlign: textAlign, // Set the text alignment.
      overflow: TextOverflow.ellipsis, // Handle text overflow by ellipsis.
      style: smallSize // Apply text style based on smallSize condition.
          ? Theme.of(context).textTheme.labelLarge // Use labelLarge text style if smallSize is true.
          : Theme.of(context).textTheme.titleSmall, // Otherwise, use titleSmall text style.
    );
  }
}
