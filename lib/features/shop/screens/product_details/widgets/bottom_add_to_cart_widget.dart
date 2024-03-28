import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/icons/circular_icon.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: ADSizes.defaultSpace, vertical: ADSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? ADColors.darkerGrey : ADColors.light,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(ADSizes.cardRadiusLg), topRight: Radius.circular(ADSizes.cardRadiusLg)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircularIcon(icon: Iconsax.minus, backgroundColor: ADColors.darkGrey, width: 40, height: 40, color: ADColors.white),
              const SizedBox(width: ADSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: ADSizes.spaceBtwItems),
              const CircularIcon(icon: Iconsax.add, backgroundColor: ADColors.black, width: 40, height: 40, color: ADColors.white),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(ADSizes.md), backgroundColor: ADColors.black, side: const BorderSide(color: ADColors.black)),
            child: const Text("Savatga qo'shish"),
          ),
        ],
      ),
    );
  }
}
