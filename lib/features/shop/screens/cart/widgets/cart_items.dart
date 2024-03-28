import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/products/cart/cart_item.dart';
import 'package:ebazaar/common/widgets/texts/product_price_text.dart';
import 'package:ebazaar/common/widgets/products/cart/add_remove_button.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (_, index) => Column(children: [
        CartItem(index: index),
        if (showAddRemoveButtons) const SizedBox(height: ADSizes.spaceBtwItems),
        if (showAddRemoveButtons)
          const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              /// Extra Space
              SizedBox(width: 70),

              /// Add Remove Button
              ProductQuantityWithAddRemoveButton(),
            ]),
            ProductPriceText(price: "256"),
          ]),
      ]),
      separatorBuilder: (_, __) => const SizedBox(height: ADSizes.spaceBtwSections),
    );
  }
}
