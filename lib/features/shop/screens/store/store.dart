import 'package:ebazaar/features/shop/screens/brands/brand_products.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/common/widgets/appbar/tabbar.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/brands/brand_card.dart';
import 'package:ebazaar/common/widgets/layouts/grid_layout.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';
import 'package:ebazaar/common/widgets/shimmers/brands_shimmer.dart';
import 'package:ebazaar/features/shop/screens/brands/all_brands.dart';
import 'package:ebazaar/features/shop/controllers/brand_controller.dart';
import 'package:ebazaar/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ebazaar/features/shop/controllers/category_controller.dart';
import 'package:ebazaar/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/search_container.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: ADAppBar(title: Text("Do'kon", style: Theme.of(context).textTheme.headlineMedium), actions: const [CartCounterIcon()]),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 440,
                automaticallyImplyLeading: false,
                backgroundColor: dark ? ADColors.black : ADColors.white,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(ADSizes.defaultSpace),
                  child: ListView(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), children: [
                    /// Search Bar
                    const SizedBox(height: ADSizes.spaceBtwItems),
                    const SearchContainer(text: "Do'kondan qidiring", showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                    const SizedBox(height: ADSizes.spaceBtwSections),

                    /// Featured Brands Heading
                    SectionHeading(title: "Mashxur brendlar", onPressed: () => Get.to(() => const AllBrandsScreen())),
                    const SizedBox(height: ADSizes.spaceBtwItems / 1.5),

                    /// Brand Cards
                    Obx(
                      () {
                        if (brandController.isLoading.value) return const ADBrandsShimmer();

                        if (brandController.featuredBrands.isEmpty) return Center(child: Text("Ma'lumot topilmadi!", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));

                        return GridLayout(
                          mainAxisExtent: 80,
                          itemCount: brandController.featuredBrands.length,
                          itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
                            return BrandCard(brand: brand, showBorder: true, onTap: () => Get.to(() => BrandProducts(brand: brand)));
                          },
                        );
                      },
                    ),
                  ]),
                ),

                /// Tab Bar
                bottom: ADTabBar(tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
              ),
            ];
          },

          /// Body
          body: TabBarView(children: categories.map((category) => CategoryTab(category: category)).toList()),
        ),
      ),
    );
  }
}
