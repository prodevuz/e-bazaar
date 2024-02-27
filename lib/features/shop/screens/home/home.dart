import 'package:ebazaar/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/common/widgets/layouts/grid_layout.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';
import 'package:ebazaar/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ebazaar/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ebazaar/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderContainer(
              child: Column(children: [
                /// AppBar
                HomeAppBar(),
                SizedBox(height: ADSizes.spaceBtwSections),

                /// SearchBar
                SearchContainer(text: "Do'kondan qidiring"),
                SizedBox(height: ADSizes.spaceBtwSections),

                /// Categories
                Padding(
                  padding: EdgeInsets.only(left: ADSizes.defaultSpace),
                  child: Column(children: [
                    /// Heading
                    SectionHeading(title: "Mashxur Kategoriyalar", showActionButton: false, textColor: ADColors.white),
                    SizedBox(height: ADSizes.spaceBtwItems),

                    /// Categories
                    HomeCategories(),
                    SizedBox(height: ADSizes.spaceBtwSections),
                  ]),
                ),
              ]),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(ADSizes.defaultSpace),
              child: Column(
                children: [
                  /// Promo slider
                  const PromoSlider(banners: [
                    ADImages.onBoardingImage1, // promoBanner1
                    ADImages.onBoardingImage2, // promoBanner2
                    ADImages.onBoardingImage3, // promoBanner3
                  ]),
                  const SizedBox(height: ADSizes.spaceBtwSections),

                  /// Popular Products
                  GridLayout(itemCount: 2, itemBuilder: (_, index) => const ProductCardVertical()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
