import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/products/cart/cart_item.dart';
import 'package:ebazaar/common/widgets/texts/product_price_text.dart';
import 'package:ebazaar/common/widgets/products/cart/add_remove_button.dart';
import 'package:ebazaar/features/shop/controllers/products/cart_controller.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Obx(
      () => ListView.separated(
        itemCount: controller.cartItems.length,
        shrinkWrap: true,
        itemBuilder: (_, index) => Obx(
          () {
            final item = controller.cartItems[index];

            return Column(children: [
              /// Cart Item
              CartItem(item: item),
              if (showAddRemoveButtons) const SizedBox(height: ADSizes.spaceBtwItems),
              
              /// Add Remove botton Row with total Price
              if (showAddRemoveButtons)
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(children: [
                    /// Extra Space
                    SizedBox(width: 70),

                    /// Add Remove Button
                    ProductQuantityWithAddRemoveButton(
                      quantity: item.quantity,
                      add: () => controller.addOneToCart(item),
                      remove: () => controller.removeOneFromCart(item),
                    ),
                  ]),
                  ProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                ]),
            ]);
          },
        ),
        separatorBuilder: (_, __) => const SizedBox(height: ADSizes.spaceBtwSections),
      ),
    );
  }
}
