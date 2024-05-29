import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/features/shop/models/brand_model.dart';
import 'package:ebazaar/common/widgets/brands/brand_card.dart';
import 'package:ebazaar/utils/helpers/cloud_helper_functions.dart';
import 'package:ebazaar/features/shop/controllers/brand_controller.dart';
import 'package:ebazaar/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ebazaar/common/widgets/products/sortable/sortable_products.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: ADAppBar(title: Text(brand.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: Column(children: [
            /// Brand Detail
            BrandCard(brand: brand, showBorder: true),
            const SizedBox(height: ADSizes.spaceBtwSections),

            FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {
                  const loader = ADVerticalProductShimmer();
                  final widget = ADCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  final brandProducts = snapshot.data!;
                  return SortableProducts(products: brandProducts);
                }),
          ]),
        ),
      ),
    );
  }
}
