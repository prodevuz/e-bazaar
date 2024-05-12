import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/layouts/grid_layout.dart';
import 'package:ebazaar/features/shop/controllers/products/product_controller.dart';
import 'package:ebazaar/common/widgets/products/product_cards/product_card_vertical.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      /// Dropdown
      DropdownButtonFormField(
        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        onChanged: (value) {},
        items: ["Nomi bo'yicha", "Qimmatroq", "Arzonroq", "Chegirma", "Eng Yangi", "Eng Mashxur"]
            .map(
              (option) => DropdownMenuItem(
                value: option,
                child: Text(option),
              ),
            )
            .toList(),
      ),
      const SizedBox(height: ADSizes.spaceBtwSections),

      /// Products
      GridLayout(itemCount: 8, itemBuilder: (_, index) => ProductCardVertical(product: ProductController.instance.featuredProducts[index])),
    ]);
  }
}
