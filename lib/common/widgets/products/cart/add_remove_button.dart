import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/icons/circular_icon.dart';

class ProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: ADSizes.md,
          color: dark ? ADColors.white : ADColors.black,
          backgroundColor: dark ? ADColors.darkerGrey : ADColors.light,
        ),
        const SizedBox(width: ADSizes.spaceBtwItems),
        Text("2", style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: ADSizes.spaceBtwItems),
        const CircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: ADSizes.md,
          color: ADColors.white,
          backgroundColor: ADColors.primary,
        ),
      ],
    );
  }
}
