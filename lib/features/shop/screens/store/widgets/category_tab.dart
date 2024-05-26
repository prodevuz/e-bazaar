import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/layouts/grid_layout.dart';
import 'package:ebazaar/features/shop/models/category_model.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';
import 'package:ebazaar/common/widgets/brands/brand_show_case.dart';
import 'package:ebazaar/features/shop/controllers/brand_controller.dart';
import 'package:ebazaar/common/widgets/shimmers/brands_showcase_shimmer.dart';
import 'package:ebazaar/features/shop/controllers/products/product_controller.dart';
import 'package:ebazaar/common/widgets/products/product_cards/product_card_vertical.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;

    return ListView(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), children: [
      Padding(
        padding: const EdgeInsets.all(ADSizes.defaultSpace),
        child: Column(children: [
          /// Brands
          Obx(
            () {
              if (brandController.allBrands.isEmpty) return const SizedBox();

              return ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  final brand = brandController.featuredBrands[index];
                  if (brandController.isLoading.value) return const ADBrandsShowcaseShimmer();
                  return BrandShowcase(brand: brand, images: const ['https://picsum.photos/500', 'https://picsum.photos/500', 'https://picsum.photos/500']);
                },
              );
            },
          ),
          const SizedBox(height: ADSizes.spaceBtwItems),

          /// Products
          SectionHeading(title: "Sizga yoqishi mumkin", onPressed: () {}),
          const SizedBox(height: ADSizes.spaceBtwItems),

          GridLayout(itemCount: ProductController.instance.featuredProducts.length, itemBuilder: (_, index) => ProductCardVertical(product: ProductController.instance.featuredProducts[index])),
          const SizedBox(height: ADSizes.spaceBtwSections),
        ]),
      ),
    ]);
  }
}
