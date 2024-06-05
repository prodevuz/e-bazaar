import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/navigation_menu.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/features/shop/screens/checkout/checkout.dart';
import 'package:ebazaar/common/widgets/loaders/animation_loader.dart';
import 'package:ebazaar/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ebazaar/features/shop/controllers/products/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Obx(
      () {
        /// Nothing found widget
        final emptyWidget = AnimationLoaderWidget(
          showAction: true,
          text: "Savat bo'm-bo'sh",
          actionText: "Savatni to'ldirish",
          animation: ADImages.cartAnimation,
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        return Scaffold(
          appBar: ADAppBar(showBackArrow: true, title: Text("Savat", style: Theme.of(context).textTheme.headlineSmall)),

          /// Items in Cart
          body: controller.cartItems.isEmpty
              ? emptyWidget
              : SingleChildScrollView(
                  child: const Padding(
                  padding: EdgeInsets.all(ADSizes.defaultSpace),
                  child: CartItems(),
                )),

          /// Checkout Button
          bottomNavigationBar: controller.cartItems.isEmpty
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(ADSizes.defaultSpace),
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const CheckoutScreen()),
                    child: Obx(() => Text("Rasmiylashtirish \$${controller.totalCartPrice.value}")),
                  )),
        );
      },
    );
  }
}
