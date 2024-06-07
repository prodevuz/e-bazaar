import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:ebazaar/utils/constants/enums.dart'; // Importing custom enums used in the app.
import 'package:ebazaar/utils/constants/sizes.dart'; // Importing custom size constants for the app.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants for the app.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Importing helper functions.
import 'package:ebazaar/features/shop/models/brand_model.dart'; // Importing the brand model.
import 'package:ebazaar/common/widgets/images/rounded_image.dart'; // Importing the rounded image widget.
import 'package:ebazaar/common/widgets/texts/brand_title_with_verified_icon.dart'; // Importing the brand title with verified icon widget.
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart'; // Importing the rounded container widget.

/// A custom widget to display a brand card.
class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    this.onTap,
    required this.brand,
    required this.showBorder,
  });

  final bool showBorder; // Whether to show the border around the brand card.
  final BrandModel brand; // The brand model containing brand data.
  final void Function()? onTap; // Callback function when the card is tapped.

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context); // Determine if the app is in dark mode.

    return GestureDetector(
      onTap: onTap, // Set the tap callback.
      child: RoundedContainer(
        showBorder: showBorder, // Set whether to show the border.
        backgroundColor: Colors.transparent, // Set the background color to transparent.
        padding: const EdgeInsets.all(ADSizes.sm), // Set the padding inside the container.
        child: Row(
          children: [
            /// Icon
            Flexible(
              child: RoundedImage(
                width: 56, // Set the width of the image.
                height: 56, // Set the height of the image.
                fit: BoxFit.contain, // Set the fit type of the image.
                isNetworkImage: true, // Indicate that the image is a network image.
                imageUrl: brand.image, // Set the image URL.
                backgroundColor: Colors.transparent, // Set the background color to transparent.
                overlayColor: dark ? ADColors.white : ADColors.black, // Set the overlay color based on the theme.
              ),
            ),
            const SizedBox(width: ADSizes.spaceBtwItems / 2), // Add horizontal space between image and text.

            /// Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min, // Set the main axis size to minimum.
                crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the cross axis.
                children: [
                  BrandTitleWithVerifiedIcon(
                    title: brand.name, // Set the brand name.
                    brandTextSize: TextSizes.large, // Set the text size.
                  ),
                  Text(
                    '${brand.productsCount} ta maxsulot', // Display the number of products.
                    overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis.
                    style: Theme.of(context).textTheme.labelMedium, // Set the text style.
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
