import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/features/shop/models/category_model.dart';
import 'package:ebazaar/common/widgets/images/rounded_image.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';
import 'package:ebazaar/utils/helpers/cloud_helper_functions.dart';
import 'package:ebazaar/features/shop/controllers/category_controller.dart';
import 'package:ebazaar/features/shop/screens/all_products/all_products.dart';
import 'package:ebazaar/common/widgets/shimmers/horizontal_product_shimmer.dart';
import 'package:ebazaar/common/widgets/products/product_cards/product_card_horizontal.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: ADAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: Column(children: [
            /// Banner
            const RoundedImage(
                width: double.infinity, imageUrl: ADImages.promoBanner3, applyImageRadius: true, isNetworkImage: true),
            const SizedBox(height: ADSizes.spaceBtwSections),

            /// Sub-Categories
            FutureBuilder(
              future: controller.getSubCategories(category.id),
              builder: (context, snapshot) {
                const loader = ADHorizontalProductShimmer();
                final widget = ADCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                if (widget != null) return widget;

                final subCategories = snapshot.data!;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: subCategories.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    final subCategory = subCategories[index];
                    return FutureBuilder(
                      future: controller.getCategoryProducts(categoryId: subCategory.id),
                      builder: (context, snapshot) {
                        final widget = ADCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                        if (widget != null) return widget;

                        final products = snapshot.data!;
                        return Column(mainAxisSize: MainAxisSize.min, children: [
                          /// Heading
                          SectionHeading(
                            title: subCategory.name,
                            onPressed: () => Get.to(
                              () => AllProductsScreen(
                                title: subCategory.name,
                                futureMethod: controller.getCategoryProducts(categoryId: subCategory.id, limit: -1),
                              ),
                            ),
                          ),
                          const SizedBox(height: ADSizes.spaceBtwSections / 2),

                          SizedBox(
                            height: 120,
                            child: ListView.separated(
                              itemCount: products.length,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (_, __) => const SizedBox(width: ADSizes.spaceBtwItems),
                              itemBuilder: (context, index) => ProductCardHorizontal(product: products[index]),
                            ),
                          ),

                          const SizedBox(height: ADSizes.spaceBtwSections),
                        ]);
                      },
                    );
                  },
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
