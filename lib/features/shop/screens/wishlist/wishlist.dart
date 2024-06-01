import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/navigation_menu.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/common/widgets/icons/circular_icon.dart';
import 'package:ebazaar/common/widgets/layouts/grid_layout.dart';
import 'package:ebazaar/utils/helpers/cloud_helper_functions.dart';
import 'package:ebazaar/common/widgets/loaders/animation_loader.dart';
import 'package:ebazaar/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ebazaar/features/shop/controllers/products/favourite_controller.dart';
import 'package:ebazaar/common/widgets/products/product_cards/product_card_vertical.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;

    return Scaffold(
      appBar: ADAppBar(
        title: Text('Yoqtirilgan', style: Theme.of(context).textTheme.headlineMedium),
        actions: [CircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const NavigationMenu()))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: Column(children: [
            Obx(
              () => FutureBuilder(
                  future: controller.favouriteProducts(),
                  builder: (context, snapshot) {
                    /// Nothing found widget
                    final emptyWidget = AnimationLoaderWidget(
                      text: "Yoqtirilgan maxsulotlar yo'q",
                      animation: ADImages.pencilAnimation,
                      showAction: true,
                      actionText: "Maxsulotlarni tanlang",
                      onActionPressed: () => Get.off(() => NavigationMenu()),
                    );

                    const loader = ADVerticalProductShimmer(itemCount: 6);
                    final widget = ADCloudHelperFunctions.checkMultiRecordState(
                      loader: loader,
                      snapshot: snapshot,
                      nothingFound: emptyWidget,
                    );
                    if (widget != null) return widget;

                    final products = snapshot.data!;
                    return GridLayout(
                      itemCount: products.length,
                      itemBuilder: (_, index) => ProductCardVertical(product: products[index]),
                    );
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
