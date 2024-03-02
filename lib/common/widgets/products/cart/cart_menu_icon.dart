import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ebazaar/utils/constants/colors.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    this.iconColor,
    required this.onPressed,
  });

  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor ?? (dark ? ADColors.white : ADColors.black),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(color: ADColors.black, borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: ADColors.white, fontSizeFactor: 0.8)),
            ),
          ),
        ),
      ],
    );
  }
}
