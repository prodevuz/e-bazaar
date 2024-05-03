import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/features/shop/screens/home/home.dart';
import 'package:ebazaar/common/widgets/icons/circular_icon.dart';
import 'package:ebazaar/common/widgets/layouts/grid_layout.dart';
import 'package:ebazaar/features/shop/controllers/product_controller.dart';
import 'package:ebazaar/common/widgets/products/product_cards/product_card_vertical.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ADAppBar(
        title: Text('Yoqtirilgan', style: Theme.of(context).textTheme.headlineMedium),
        actions: [CircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: Column(children: [
            GridLayout(itemCount: 6, itemBuilder: (_, index) => ProductCardVertical(product: ProductController.instance.featuredProducts[index])),
          ]),
        ),
      ),
    );
  }
}
