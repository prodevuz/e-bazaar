import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/common/widgets/shimmers/category_shimmer.dart';
import 'package:ebazaar/features/shop/controllers/category_controller.dart';
import 'package:ebazaar/features/shop/screens/sub_category/sub_categories.dart';
import 'package:ebazaar/common/widgets/image_text_widgets/vertical_image_text.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;

    return Obx(() {
      if (categoryController.isLoading.value) return const ADCategoryShimmer();

      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text("Ma'lumot topilmadi!", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
        );
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return VerticalImageText(
              title: category.name,
              image: category.image,
              onTap: () => Get.to(() => SubCategoriesScreen(category: category)),
            );
          },
        ),
      );
    });
  }
}
