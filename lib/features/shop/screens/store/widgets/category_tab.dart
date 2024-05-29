import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/layouts/grid_layout.dart';
import 'package:ebazaar/features/shop/models/category_model.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';
import 'package:ebazaar/utils/helpers/cloud_helper_functions.dart';
import 'package:ebazaar/features/shop/controllers/category_controller.dart';
import 'package:ebazaar/features/shop/screens/all_products/all_products.dart';
import 'package:ebazaar/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ebazaar/features/shop/screens/store/widgets/category_brands.dart';
import 'package:ebazaar/common/widgets/products/product_cards/product_card_vertical.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: Column(children: [
            /// Brands
            CategoryBrands(category: category),
            const SizedBox(height: ADSizes.spaceBtwItems),

            /// Products
            FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {
                  final response = ADCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: const ADVerticalProductShimmer());
                  if (response != null) return response;

                  final products = snapshot.data!;
                  return Column(
                    children: [
                      SectionHeading(
                        title: "Sizga yoqishi mumkin",
                        onPressed: () => Get.to(() => AllProductsScreen(title: category.name, futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1))),
                      ),
                      const SizedBox(height: ADSizes.spaceBtwItems),
                      GridLayout(itemCount: products.length, itemBuilder: (_, index) => ProductCardVertical(product: products[index])),
                    ],
                  );
                }),
          ]),
        ),
      ],
    );
  }
}
