import 'package:ebazaar/common/widgets/shimmers/shimmer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebazaar/common/widgets/images/rounded_image.dart';
import 'package:ebazaar/features/shop/controllers/banner_controller.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/circular_container.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Obx(
      () {
        if (controller.isLoading.value) return const ADShimmerEffect(width: double.infinity, height: 190);

        if (controller.banners.isEmpty) {
          return const Center(child: Text("Ma'lumot topilmadi"));
        } else {
          return Column(children: [
            CarouselSlider(
              options: CarouselOptions(viewportFraction: 1, onPageChanged: (index, _) => controller.updatePageIndicator(index)),
              items: controller.banners
                  .map((banner) => RoundedImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: true,
                        onPressed: () => Get.toNamed(banner.targetScreen),
                      ))
                  .toList(),
            ),
            const SizedBox(height: ADSizes.spaceBtwItems),
            Center(
              child: Obx(
                () => Row(mainAxisSize: MainAxisSize.min, children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    CircularContainer(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor: controller.carouselCurrentIndex.value == i ? ADColors.primary : ADColors.grey,
                    ),
                ]),
              ),
            ),
          ]);
        }
      },
    );
  }
}
