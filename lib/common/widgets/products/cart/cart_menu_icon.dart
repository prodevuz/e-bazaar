import 'package:ebazaar/features/shop/screens/cart/cart.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ebazaar/utils/constants/colors.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    this.isHome = false,
  });

  final bool isHome;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: isHome
                ? ADColors.white
                : dark
                    ? ADColors.white.withOpacity(0.9)
                    : ADColors.black,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: isHome
                  ? ADColors.black
                  : dark
                      ? ADColors.white
                      : ADColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: isHome
                          ? ADColors.white
                          : dark
                              ? ADColors.black
                              : ADColors.white,
                      fontSizeFactor: 0.8,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
