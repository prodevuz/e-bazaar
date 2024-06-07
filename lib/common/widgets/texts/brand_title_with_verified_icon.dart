import 'package:iconsax/iconsax.dart'; // Iconsax package for custom icons.
import 'package:flutter/material.dart'; // Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Custom size constants for the app.
import 'package:ebazaar/utils/constants/enums.dart'; // Enums for different text sizes.
import 'package:ebazaar/utils/constants/colors.dart'; // Custom color constants for the app.
import 'package:ebazaar/common/widgets/texts/brand_title_text.dart'; // Widget for displaying brand titles.

class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon({
    super.key,
    this.textColor, // Color of the text.
    this.maxLines = 1, // Maximum number of lines before truncation.
    required this.title, // Title text to display.
    this.iconColor = ADColors.primary, // Color of the verification icon.
    this.textAlign = TextAlign.center, // Text alignment.
    this.brandTextSize = TextSizes.small, // Text size enum, default is small.
  });

  final String title; // Title text to display.
  final int maxLines; // Maximum number of lines before truncation.
  final Color? textColor, iconColor; // Color of the text and verification icon.
  final TextAlign? textAlign; // Text alignment.
  final TextSizes brandTextSize; // Text size enum.

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Row size adjusted to its children.
      children: [
        Flexible(
          /// Display the brand title text.
          child: BrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: ADSizes.xs), // Add small space between the brand title and the icon.
        const Icon(Iconsax.verify5, color: ADColors.primary, size: ADSizes.iconXs), // Display the verification icon.
      ],
    );
  }
}
