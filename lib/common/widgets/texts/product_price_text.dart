import 'package:flutter/material.dart'; // Flutter material package for UI components.

class ProductPriceText extends StatelessWidget {
  const ProductPriceText({
    super.key,
    this.maxLines = 1, // Maximum number of lines before truncation.
    required this.price, // Price text to display.
    this.isLarge = false, // Whether to use a large text size.
    this.lineThrough = false, // Whether to apply a line-through decoration.
    this.currencySign = '\$', // Currency sign.
  });

  final bool isLarge; // Whether to use a large text size.
  final int maxLines; // Maximum number of lines before truncation.
  final bool lineThrough; // Whether to apply a line-through decoration.
  final String currencySign, price; // Currency sign and price text.

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price, // Display the currency sign followed by the price.
      maxLines: maxLines, // Set the maximum number of lines.
      overflow: TextOverflow.ellipsis, // Handle text overflow by ellipsis.
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context)
              .textTheme
              .titleLarge!
              .apply(decoration: lineThrough ? TextDecoration.lineThrough : null), // Apply text style based on isLarge condition, with optional line-through decoration.
    );
  }
}
