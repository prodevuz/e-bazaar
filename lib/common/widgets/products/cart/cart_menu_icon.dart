import 'package:ebazaar/features/shop/controllers/products/cart_controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/features/shop/screens/cart/cart.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(CartController());

    return Stack(children: [
      IconButton(onPressed: () => Get.to(() => const CartScreen()), icon: Icon(Iconsax.shopping_bag, color: iconColor)),
      Positioned(
        right: 0,
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
              color: counterBgColor ?? (dark ? ADColors.white : ADColors.black),
              borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: Obx(
              () => Text(
                controller.noOfCartItems.value.toString(),
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      fontSizeFactor: 0.8,
                      color: counterTextColor ?? (dark ? ADColors.black : ADColors.white),
                    ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
