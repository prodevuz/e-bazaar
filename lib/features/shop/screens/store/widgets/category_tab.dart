import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/common/widgets/layouts/grid_layout.dart';
import 'package:ebazaar/features/shop/models/category_model.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';
import 'package:ebazaar/common/widgets/brands/brand_show_case.dart';
import 'package:ebazaar/common/widgets/products/product_cards/product_card_vertical.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), children: [
      Padding(
        padding: const EdgeInsets.all(ADSizes.defaultSpace),
        child: Column(children: [
          /// Brands
          const BrandShowcase(brand: "Gucci", images: [ADImages.productImage6, ADImages.productImage3, ADImages.productImage1]),
          const BrandShowcase(images: [ADImages.productImage4, ADImages.productImage2, ADImages.productImage5]),
          const SizedBox(height: ADSizes.spaceBtwItems),

          /// Products
          SectionHeading(title: "Sizga yoqishi mumkin", onPressed: () {}),
          const SizedBox(height: ADSizes.spaceBtwItems),

          GridLayout(itemCount: ADImages.productImages.length, itemBuilder: (_, index) => ProductCardVertical(image: ADImages.productImages[index])),
          const SizedBox(height: ADSizes.spaceBtwSections),
        ]),
      ),
    ]);
  }
}
