import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: ADSizes.defaultSpace),
  });

  final String text;
  final IconData icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: HelperFunctions.screenWidth(), //# ADDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(ADSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? ADColors.dark
                    : ADColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(ADSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: ADColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: ADColors.darkerGrey),
              const SizedBox(width: ADSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
