import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/images/rounded_image.dart';
import 'package:ebazaar/features/shop/models/cart_item_model.dart';
import 'package:ebazaar/common/widgets/texts/product_title_text.dart';
import 'package:ebazaar/common/widgets/texts/brand_title_with_verified_icon.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.item});

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Row(children: [
      /// Image
      RoundedImage(
        width: 60,
        height: 60,
        isNetworkImage: true,
        imageUrl: item.image ?? '',
        padding: const EdgeInsets.all(0),
        border: Border.all(color: ADColors.primary),
        backgroundColor: dark ? ADColors.darkerGrey : ADColors.light,
      ),
      const SizedBox(width: ADSizes.spaceBtwItems),

      /// Title, Price & Size
      Expanded(
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          BrandTitleWithVerifiedIcon(title: item.brandName ?? ''),
          Flexible(child: ProductTitleText(title: item.title, maxLines: 1)),

          /// Attributes
          Text.rich(
            TextSpan(
              children: (item.selectedVariation ?? {})
                  .entries
                  .map((e) => TextSpan(children: [
                        TextSpan(text: "${e.key} ", style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: "${e.value} ", style: Theme.of(context).textTheme.bodyLarge),
                      ]))
                  .toList(),
            ),
          ),
        ]),
      ),
    ]);
  }
}
