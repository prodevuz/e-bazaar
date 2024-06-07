import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/common/widgets/images/rounded_image.dart';
import 'package:ebazaar/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:ebazaar/features/shop/controllers/products/images_controller.dart';
import 'package:ebazaar/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = ImagesController.instance;
    final images = controller.getAllProductImages(product);

    return CurvedEdgeWidget(
      child: Container(
        color: dark ? ADColors.darkerGrey : ADColors.light,
        child: Stack(children: [
          /// Main Large Image
          SizedBox(
            height: 400,
            width: double.infinity,
            child: Obx(
              () {
                final image = controller.selectedProductImage.value;
                return GestureDetector(
                  onTap: () => controller.showEnlargedImage(image),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: controller.selectedProductImage.value,
                    progressIndicatorBuilder: (_, __, downloadProgress) => Center(
                      child: CircularProgressIndicator(color: ADColors.primary, value: downloadProgress.progress),
                    ),
                  ),
                );
              },
            ),
          ),

          /// Image Slider
          Positioned(
            right: 0,
            bottom: 30,
            left: ADSizes.defaultSpace,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                separatorBuilder: (_, __) => const SizedBox(width: ADSizes.spaceBtwItems),
                itemBuilder: (_, index) => Obx(
                  () {
                    final imageSelected = controller.selectedProductImage.value == images[index];
                    return RoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      imageUrl: images[index],
                      backgroundColor: dark ? ADColors.dark : ADColors.white,
                      onPressed: () => controller.selectedProductImage.value = images[index],
                      border: Border.all(color: imageSelected ? ADColors.primary : Colors.transparent),
                    );
                  },
                ),
              ),
            ),
          ),

          /// AppBar Icons
          ADAppBar(
            showBackArrow: true,
            arrowColor: ADColors.dark,
            actions: [ADFavouriteIcon(productId: product.id)],
          ),
        ]),
      ),
    );
  }
}
