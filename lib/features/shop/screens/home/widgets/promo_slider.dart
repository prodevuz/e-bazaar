import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebazaar/common/widgets/images/rounded_image.dart';
import 'package:ebazaar/features/shop/controllers/home_controller.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/circular_container.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(children: [
      CarouselSlider(options: CarouselOptions(viewportFraction: 1, onPageChanged: (index, _) => controller.updatePageIndicator(index)), items: banners.map((url) => RoundedImage(imageUrl: url)).toList()),
      const SizedBox(height: ADSizes.spaceBtwItems),
      Center(
        child: Obx(
          () => Row(mainAxisSize: MainAxisSize.min, children: [
            for (int i = 0; i < banners.length; i++) CircularContainer(width: 20, height: 4, margin: const EdgeInsets.only(right: 10), backgroundColor: controller.carouselCurrentIndex.value == i ? ADColors.primary : ADColors.grey),
          ]),
        ),
      ),
    ]);
  }
}
