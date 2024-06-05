import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/icons/circular_icon.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/features/shop/controllers/products/cart_controller.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: ADSizes.defaultSpace, vertical: ADSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? ADColors.darkerGrey : ADColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(ADSizes.cardRadiusLg),
          topRight: Radius.circular(ADSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            CircularIcon(
              width: 40,
              height: 40,
              icon: Iconsax.minus,
              color: ADColors.white,
              backgroundColor: ADColors.darkGrey,
              onPressed: () =>
                  controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart.value -= 1,
            ),
            const SizedBox(width: ADSizes.spaceBtwItems),
            Text(controller.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(width: ADSizes.spaceBtwItems),
            CircularIcon(
              width: 40,
              height: 40,
              icon: Iconsax.add,
              color: ADColors.white,
              backgroundColor: ADColors.black,
              onPressed: () => controller.productQuantityInCart.value += 1,
            ),
          ]),
          ElevatedButton(
            onPressed: controller.productQuantityInCart.value < 1 ? null : () => controller.addToCart(product),
            style: ElevatedButton.styleFrom(
                backgroundColor: ADColors.black,
                padding: const EdgeInsets.all(ADSizes.md),
                side: const BorderSide(color: ADColors.black)),
            child: const Text("Savatga qo'shish"),
          ),
        ]),
      ),
    );
  }
}
