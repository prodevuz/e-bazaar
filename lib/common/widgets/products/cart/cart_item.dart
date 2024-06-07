import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Importing custom size constants for the app.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants for the app.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Importing helper functions for common tasks.
import 'package:ebazaar/common/widgets/images/rounded_image.dart'; // Widget for displaying rounded images.
import 'package:ebazaar/features/shop/models/cart_item_model.dart'; // Importing the model for a cart item.
import 'package:ebazaar/common/widgets/texts/product_title_text.dart'; // Widget for displaying product titles.
import 'package:ebazaar/common/widgets/texts/brand_title_with_verified_icon.dart'; // Widget for displaying brand titles with verified icon.

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.item});

  final CartItemModel item; // The cart item to be displayed.

  @override
  Widget build(BuildContext context) {
    // Check if dark mode is enabled.
    final bool isDarkMode = HelperFunctions.isDarkMode(context);

    // Display the cart item's image with rounded corners.
    return Row(
      children: [
        // Displaying the product image.
        RoundedImage(
          width: 60, // Setting the width of the image container.
          height: 60, // Setting the height of the image container.
          isNetworkImage: true, // Specifying if the image is loaded from the network.
          imageUrl: item.image ?? '', // Providing the image URL or an empty string if it's not available.
          padding: const EdgeInsets.all(0), // Applying zero padding around the image container.
          border: Border.all(color: ADColors.primary), // Adding a border around the image container.
          backgroundColor: isDarkMode ? ADColors.darkerGrey : ADColors.light, // Setting the background color based on the current mode.
        ),
        const SizedBox(width: ADSizes.spaceBtwItems), // Adding space between the image and other widgets.

        // Displaying product details.
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Setting the column size to minimum.
            crossAxisAlignment: CrossAxisAlignment.start, // Aligning children to the start (left) of the column.
            children: [
              // Displaying the brand title with a verified icon, if available.
              BrandTitleWithVerifiedIcon(title: item.brandName ?? ''),
              // Displaying the product title with a maximum of 1 line.
              Flexible(
                child: ProductTitleText(
                  title: item.title,
                  maxLines: 1,
                ),
              ),
              // Displaying additional product attributes using Text.rich.
              Text.rich(
                TextSpan(
                  children: (item.selectedVariation ?? {}) // Mapping over the selected variations.
                      .entries
                      .map(
                        (MapEntry<String, String> entry) => TextSpan(
                          children: [
                            TextSpan(
                              text: "${entry.key} ", // Displaying the attribute key.
                              style: Theme.of(context).textTheme.bodySmall, // Applying the appropriate text style.
                            ),
                            TextSpan(
                              text: "${entry.value} ", // Displaying the attribute value.
                              style: Theme.of(context).textTheme.bodyLarge, // Applying the appropriate text style.
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
