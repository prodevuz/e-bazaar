import 'package:get/get.dart'; // Package for state management.
import 'package:iconsax/iconsax.dart'; // Package for custom icons.
import 'package:flutter/material.dart'; // Flutter material package for UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Custom size constants for the app.
import 'package:ebazaar/features/shop/models/product_model.dart'; // Model for a product.
import 'package:ebazaar/common/widgets/layouts/grid_layout.dart'; // Widget for displaying a grid layout.
import 'package:ebazaar/features/shop/controllers/all_products_controller.dart'; // Controller for managing all products.
import 'package:ebazaar/common/widgets/products/product_cards/product_card_vertical.dart'; // Widget for displaying a vertical product card.

class SortableProducts extends StatelessWidget {
  const SortableProducts({super.key, required this.products});

  final List<ProductModel> products; // The list of products to display.

  @override
  Widget build(BuildContext context) {
    final controller = AllProductsController.instance; // Get the controller instance.
    controller.assignProducts(products); // Assign the products to the controller.

    return Column(children: [
      DropdownButtonFormField(
        // Dropdown button for sorting options.
        value: controller.selectedSortOption.value, // Set the initial selected value.
        onChanged: (value) => controller.sortProducts(value!), // Callback for when an option is selected.
        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)), // Decoration for the dropdown button.
        items: ["Nomi", "Qimmatroq", "Arzonroq", "Chegirma", "Eng Yangi", "Eng Mashxur"].map((option) {
          // List of dropdown items.
          return DropdownMenuItem(value: option, child: Text(option)); // Map each option to a dropdown menu item.
        }).toList(),
      ),
      const SizedBox(height: ADSizes.spaceBtwSections), // Add space between sections.
      Obx(() {
        // Observer widget for reactive updates.
        return GridLayout(
          // Widget for displaying a grid layout.
          itemCount: controller.products.length, // Set the number of items in the grid.
          itemBuilder: (_, index) => ProductCardVertical(product: controller.products[index]), // Builder function for each grid item.
        );
      }),
    ]);
  }
}
