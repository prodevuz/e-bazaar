import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/common/widgets/brands/brand_card.dart';
import 'package:ebazaar/common/widgets/layouts/grid_layout.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';
import 'package:ebazaar/common/widgets/shimmers/brands_shimmer.dart';
import 'package:ebazaar/features/shop/controllers/brand_controller.dart';
import 'package:ebazaar/features/shop/screens/brands/brand_products.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return Scaffold(
      appBar: const ADAppBar(title: Text("Brendlar"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: Column(children: [
            /// Heading
            const SectionHeading(title: "Brendlar", showActionButton: false),
            const SizedBox(height: ADSizes.spaceBtwItems),

            /// Brand Cards
            Obx(
              () {
                if (controller.isLoading.value) return const ADBrandsShimmer();

                if (controller.allBrands.isEmpty) return Center(child: Text("Ma'lumot topilmadi!", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));

                return GridLayout(
                  mainAxisExtent: 80,
                  itemCount: controller.allBrands.length,
                  itemBuilder: (_, index) {
                    final brand = controller.allBrands[index];
                    return BrandCard(brand: brand, showBorder: true, onTap: () => Get.to(() => BrandProducts(brand: brand)));
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
