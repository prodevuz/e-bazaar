import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// Variables
  RxString selectedProductImage = ''.obs;

  /// Get All images from product and all variations
  List<String> getAllProductImages(ProductModel product) {
    // Use Set to add unique images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(product.thumbnail);

    // Assign thumbnail as selected image
    selectedProductImage.value = product.thumbnail;

    // Get All the images from product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    // Get All the images from product variations if not null
    if (product.productVariations != null || product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  /// Show image popup
  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: ADSizes.defaultSpace * 2, horizontal: ADSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: ADSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Yopish'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
