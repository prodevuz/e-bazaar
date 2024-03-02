import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ebazaar/common/widgets/images/circular_image.dart';
import 'package:ebazaar/common/widgets/layouts/grid_layout.dart';
import 'package:ebazaar/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ebazaar/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/constants/enums.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: ADAppBar(
        title: Text("Do'kon", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CartCounterIcon(onPressed: () {}),
        ],
      ),
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
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    /// Search Bar
                    const SizedBox(height: ADSizes.spaceBtwItems),
                    const SearchContainer(
                      text: "Do'kondan qidiring",
                      showBorder: true,
                      showBackground: false,
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: ADSizes.spaceBtwSections),

                    /// Featured Brands
                    SectionHeading(title: "Mashxur brendlar", onPressed: () {}),
                    const SizedBox(height: ADSizes.spaceBtwItems / 1.5),

                    GridLayout(
                      itemCount: 4,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: RoundedContainer(
                            padding: const EdgeInsets.all(ADSizes.sm),
                            showBorder: true,
                            backgroundColor: Colors.transparent,
                            child: Row(
                              children: [
                                /// Icon
                                Flexible(child: SircularImage(image: ADImages.clothIcon, backgroundColor: Colors.transparent, overlayColor: dark ? ADColors.white : ADColors.black)),
                                const SizedBox(width: ADSizes.spaceBtwItems / 2),

                                /// Text
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const BrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large),
                                      Text(
                                        '256 maxsulot',
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: const SizedBox(),
      ),
    );
  }
}
