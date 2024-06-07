import 'package:flutter/material.dart'; // Flutter material package for UI components.
import 'package:ebazaar/utils/constants/enums.dart'; // Enums for different text sizes.

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key,
    this.color, // Color of the text.
    this.maxLines = 1, // Maximum number of lines before truncation.
    required this.title, // Title text to display.
    this.textAlign = TextAlign.center, // Text alignment.
    this.brandTextSize = TextSizes.small, // Text size enum, default is small.
  });

  final Color? color; // Color of the text.
  final String title; // Title text to display.
  final int maxLines; // Maximum number of lines before truncation.
  final TextAlign? textAlign; // Text alignment.
  final TextSizes brandTextSize; // Text size enum.

  @override
  Widget build(BuildContext context) {
    return Text(
      title, // Title text to display.
      maxLines: maxLines, // Maximum number of lines before truncation.
      textAlign: textAlign, // Text alignment.
      overflow: TextOverflow.ellipsis, // Overflow behavior if text exceeds available space.
      style: brandTextSize == TextSizes.small // Conditionally apply text style based on text size enum.
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color) // Apply small text style.
          : brandTextSize == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color) // Apply medium text style.
              : brandTextSize == TextSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color) // Apply large text style.
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color), // Apply default text style.
    );
  }
}
