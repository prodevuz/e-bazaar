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
import 'package:ebazaar/features/shop/screens/brands/all_brands.dart';
import 'package:ebazaar/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ebazaar/features/shop/controllers/category_controller.dart';
import 'package:ebazaar/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/search_container.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: ADAppBar(title: Text("Do'kon", style: Theme.of(context).textTheme.headlineMedium), actions: const [CartCounterIcon()]),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? ADColors.black : ADColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(ADSizes.defaultSpace),
                  child: ListView(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), children: [
                    /// Search Bar
                    const SizedBox(height: ADSizes.spaceBtwItems),
                    const SearchContainer(text: "Do'kondan qidiring", showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                    const SizedBox(height: ADSizes.spaceBtwSections),

                    /// Featured Brands
                    SectionHeading(title: "Mashxur brendlar", onPressed: () => Get.to(() => const AllBrandsScreen())),
                    const SizedBox(height: ADSizes.spaceBtwItems / 1.5),

                    /// Brand Cards
                    GridLayout(
                      itemCount: 4,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        List<String> brands = ["Nike", "Adidas", "Gucci", "Puma"];
                        return BrandCard(name: brands[index], showBorder: true);
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
