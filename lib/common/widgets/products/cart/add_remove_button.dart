import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/icons/circular_icon.dart';

class ProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddRemoveButton({super.key, required this.quantity, this.add, this.remove});

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Row(mainAxisSize: MainAxisSize.min, children: [
      CircularIcon(
        width: 32,
        height: 32,
        size: ADSizes.md,
        onPressed: remove,
        icon: Iconsax.minus,
        color: dark ? ADColors.white : ADColors.black,
        backgroundColor: dark ? ADColors.darkerGrey : ADColors.light,
      ),
      const SizedBox(width: ADSizes.spaceBtwItems),
      Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall),
      const SizedBox(width: ADSizes.spaceBtwItems),
      CircularIcon(
        width: 32,
        height: 32,
        onPressed: add,
        size: ADSizes.md,
        icon: Iconsax.add,
        color: ADColors.white,
        backgroundColor: ADColors.primary,
      ),
    ]);
  }
}
