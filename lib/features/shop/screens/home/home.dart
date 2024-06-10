import 'package:get/get.dart'; // Importing the Get package for state management.
import 'package:flutter/material.dart'; // Importing the material library for Flutter UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Importing size constants used in the app.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing color constants used in the app.
import 'package:ebazaar/common/widgets/layouts/grid_layout.dart'; // Importing custom grid layout widget.
import 'package:ebazaar/common/widgets/texts/section_heading.dart'; // Importing custom section heading widget.
import 'package:ebazaar/features/shop/screens/home/widgets/home_appbar.dart'; // Importing custom home app bar widget.
import 'package:ebazaar/features/shop/screens/home/widgets/promo_slider.dart'; // Importing custom promo slider widget.
import 'package:ebazaar/features/shop/screens/all_products/all_products.dart'; // Importing all products screen.
import 'package:ebazaar/common/widgets/shimmers/vertical_product_shimmer.dart'; // Importing vertical product shimmer widget.
import 'package:ebazaar/features/shop/screens/home/widgets/home_categories.dart'; // Importing home categories widget.
import 'package:ebazaar/features/shop/controllers/products/product_controller.dart'; // Importing product controller.
import 'package:ebazaar/common/widgets/custom_shapes/containers/search_container.dart'; // Importing custom search container widget.
import 'package:ebazaar/common/widgets/products/product_cards/product_card_vertical.dart'; // Importing vertical product card widget.
import 'package:ebazaar/common/widgets/custom_shapes/containers/primary_header_container.dart'; // Importing primary header container widget.

class HomeScreen extends StatelessWidget {
  // Defining a stateless widget for the home screen.
  const HomeScreen({super.key}); // Constructor for the HomeScreen widget.

  @override
  Widget build(BuildContext context) {
    // Build method for constructing the widget.
    final controller = ProductController.instance; // Accessing the product controller instance.

    return Scaffold(
      // Returning a scaffold widget for the home screen.
      body: SingleChildScrollView(
        // Allowing scrolling within the screen.
        child: Column(children: [
          // Column layout to arrange widgets vertically.
          const PrimaryHeaderContainer(
            // Custom container for primary header.
            child: Column(children: [
              // Column layout for primary header content.
              /// AppBar
              HomeAppBar(), // Displaying the custom home app bar.
              SizedBox(height: ADSizes.spaceBtwSections), // Adding spacing between sections.

              /// SearchBar
              SearchContainer(text: "Do'kondan qidiring"), // Displaying the search container.
              SizedBox(height: ADSizes.spaceBtwSections), // Adding spacing between sections.

              /// Categories
              Padding(
                // Adding padding to the categories section.
                padding: EdgeInsets.only(left: ADSizes.defaultSpace), // Setting left padding.
                child: Column(children: [
                  // Column layout for categories content.
                  /// Heading
                  SectionHeading(title: "Mashxur Kategoriyalar", showActionButton: false, textColor: ADColors.white), // Displaying section heading.
                  SizedBox(height: ADSizes.spaceBtwItems), // Adding spacing between items.

                  /// Categories
                  HomeCategories(), // Displaying home categories.
                ]),
              ),
              SizedBox(height: ADSizes.spaceBtwSections), // Adding spacing between sections.
            ]),
          ),

          /// Body
          Padding(
            // Adding padding to the body section.
            padding: const EdgeInsets.all(ADSizes.defaultSpace), // Setting default padding.
            child: Column(children: [
              // Column layout for body content.
              /// Promo slider
              const PromoSlider(), // Displaying the promo slider.
              const SizedBox(height: ADSizes.spaceBtwSections), // Adding spacing between sections.

              SectionHeading(
                // Section heading for popular products.
                title: "Mashxur Maxsulotlar", // Setting the title.
                showActionButton: true, // Showing action button.
                onPressed: () => Get.to(
                  // Navigating to all products screen.
                  () => AllProductsScreen(
                    title: "Mashxur Maxsulotlar", // Setting screen title.
                    futureMethod: controller.fetchAllFeaturedProducts(), // Fetching featured products.
                  ),
                ),
              ),
              const SizedBox(height: ADSizes.spaceBtwItems), // Adding spacing between items.

              /// Popular Products
              Obx(() {
                // Using GetX Obx for reactive UI update based on controller state.
                if (controller.isLoading.value) return const ADVerticalProductShimmer(); // Displaying vertical product shimmer while loading.

                if (controller.featuredProducts.isEmpty) // Checking if no featured products are available.
                  return Center(child: Text("Ma'lumot topilmadi", style: Theme.of(context).textTheme.bodyMedium)); // Displaying a message when no data is available.

                return GridLayout(
                  // Displaying grid layout for products.
                  itemCount: controller.featuredProducts.length, // Setting item count.
                  itemBuilder: (_, index) => ProductCardVertical(product: controller.featuredProducts[index]), // Building product card for each item.
                );
              }),
            ]),
          ),
        ]),
      ),
    );
  }
}
