import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/common/widgets/layouts/grid_layout.dart';
import 'package:ebazaar/features/shop/controllers/all_products_controller.dart';
import 'package:ebazaar/common/widgets/products/product_cards/product_card_vertical.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product sorting
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);

    return Column(children: [
      /// Dropdown
      DropdownButtonFormField(
        value: controller.selectedSortOption.value,
        onChanged: (value) {
          // Sort products based on the selected option
          controller.sortProducts(value!);
        },
        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        items: ["Nomi", "Qimmatroq", "Arzonroq", "Chegirma", "Eng Yangi", "Eng Mashxur"].map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
      ),
      const SizedBox(height: ADSizes.spaceBtwSections),

      /// Products
      Obx(() => GridLayout(itemCount: controller.products.length, itemBuilder: (_, index) => ProductCardVertical(product: controller.products[index]))),
    ]);
  }
}
