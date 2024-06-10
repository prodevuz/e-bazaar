import 'package:get/get.dart'; // Importing the Get package for state management.
import 'package:flutter/material.dart'; // Importing the material library for Flutter UI components.
import 'package:ebazaar/common/widgets/shimmers/category_shimmer.dart'; // Importing category shimmer widget.
import 'package:ebazaar/features/shop/controllers/category_controller.dart'; // Importing category controller.
import 'package:ebazaar/features/shop/screens/sub_category/sub_categories.dart'; // Importing sub-categories screen.
import 'package:ebazaar/common/widgets/image_text_widgets/vertical_image_text.dart'; // Importing vertical image text widget.

// Defining a stateless widget for home categories.
class HomeCategories extends StatelessWidget {
  const HomeCategories({Key? key}); // Constructor for the HomeCategories widget.

  @override
  // Build method for constructing the widget.
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance; // Accessing the category controller instance.

    // Using GetX Obx for reactive UI update based on controller state.
    return Obx(() {
      if (categoryController.isLoading.value) return const ADCategoryShimmer(); // Displaying category shimmer while loading.

      // Checking if no categories are available.
      if (categoryController.featuredCategories.isEmpty) {
        // Centering text widget.
        return Center(
          child: Text("Ma'lumot topilmadi!", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)), // Displaying a message when no data is available.
        );
      }

      // Creating a sized box to contain the list of categories.
      return SizedBox(
        height: 80, // Setting the height of the sized box.
        // Creating a list view builder for horizontal scrolling.
        child: ListView.builder(
          shrinkWrap: true, // Allowing the list view to shrink wrap its content.
          itemCount: categoryController.featuredCategories.length, // Setting the number of items in the list.
          scrollDirection: Axis.horizontal, // Setting the scroll direction to horizontal.
          // Building each item in the list.
          itemBuilder: (_, index) {
            // Creating a vertical image text widget for each category.
            final category = categoryController.featuredCategories[index]; // Getting the category at the current index.
            return VerticalImageText(
              title: category.name, // Setting the title of the widget to the category name.
              image: category.image, // Setting the image of the widget to the category image.
              onTap: () => Get.to(() => SubCategoriesScreen(category: category)), // Navigating to sub-categories screen on tap.
            );
          },
        ),
      );
    });
  }
}
