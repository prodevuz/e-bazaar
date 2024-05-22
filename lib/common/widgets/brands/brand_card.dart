import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/enums.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/features/shop/models/brand_model.dart';
import 'package:ebazaar/common/widgets/images/circular_image.dart';
import 'package:ebazaar/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    this.onTap,
    required this.brand,
    required this.showBorder,
  });

  final bool showBorder;
  final BrandModel brand;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        padding: const EdgeInsets.all(ADSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(children: [
          /// Icon
          Flexible(child: CircularImage(image: brand.image, backgroundColor: Colors.transparent, overlayColor: dark ? ADColors.white : ADColors.black)),
          const SizedBox(width: ADSizes.spaceBtwItems / 2),

          /// Text
          Expanded(
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
              BrandTitleWithVerifiedIcon(title: brand.name, brandTextSize: TextSizes.large),
              Text('${brand.productsCount} ta maxsulot', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium),
            ]),
          ),
        ]),
      ),
    );
  }
}
