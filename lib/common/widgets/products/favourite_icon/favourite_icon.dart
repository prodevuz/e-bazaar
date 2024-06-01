import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/common/widgets/icons/circular_icon.dart';
import 'package:ebazaar/features/shop/controllers/products/favourite_controller.dart';

class ADFavouriteIcon extends StatelessWidget {
  const ADFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());

    return Obx(() => CircularIcon(
          icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
          color: controller.isFavourite(productId) ? ADColors.error : null,
          onPressed: () => controller.toggleFavouriteProduct(productId),
        ));
  }
}
