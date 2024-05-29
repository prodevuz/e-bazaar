import 'package:flutter/widgets.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/features/shop/models/category_model.dart';
import 'package:ebazaar/utils/helpers/cloud_helper_functions.dart';
import 'package:ebazaar/common/widgets/shimmers/boxes_shimmer.dart';
import 'package:ebazaar/common/widgets/brands/brand_show_case.dart';
import 'package:ebazaar/common/widgets/shimmers/list_tile_shimmer.dart';
import 'package:ebazaar/features/shop/controllers/brand_controller.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          const loader = Column(
            children: [
              ADListTileShimmer(),
              SizedBox(height: ADSizes.spaceBtwItems),
              ADBoxesShimmer(),
              SizedBox(height: ADSizes.spaceBtwItems),
            ],
          );

          final widget = ADCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          final brands = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: brands.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {
                    final widget = ADCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    final products = snapshot.data!;
                    return BrandShowcase(brand: brand, images: products.map((product) => product.thumbnail).toList());
                  });
            },
          );
        });
  }
}
