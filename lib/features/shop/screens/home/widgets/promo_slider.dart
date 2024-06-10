import 'package:get/get.dart'; // Importing the Get package for state management.
import 'package:flutter/material.dart'; // Importing the material library for Flutter UI components.
import 'package:ebazaar/utils/constants/sizes.dart'; // Importing size constants used in the app.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing color constants used in the app.
import 'package:carousel_slider/carousel_slider.dart'; // Importing carousel slider package.
import 'package:ebazaar/common/widgets/shimmers/shimmer.dart'; // Importing shimmer effect widget.
import 'package:ebazaar/common/widgets/images/rounded_image.dart'; // Importing rounded image widget.
import 'package:ebazaar/features/shop/controllers/banner_controller.dart'; // Importing banner controller.
import 'package:ebazaar/common/widgets/custom_shapes/containers/circular_container.dart'; // Importing circular container widget.

class PromoSlider extends StatelessWidget {
  // Defining a stateless widget for the promo slider.
  const PromoSlider({Key? key}); // Constructor for the PromoSlider widget.

  @override
  Widget build(BuildContext context) {
    // Build method for constructing the widget.
    final controller = BannerController.instance; // Accessing the banner controller instance.

    return Obx(
      // Using GetX Obx for reactive UI update based on controller state.
      () {
        if (controller.isLoading.value) return const ADShimmerEffect(width: double.infinity, height: 190); // Displaying shimmer effect while loading.

        if (controller.banners.isEmpty) {
          // Checking if no banners are available.
          return const Center(child: Text("Ma'lumot topilmadi")); // Displaying a message when no data is available.
        } else {
          return Column(children: [
            // Column layout to arrange widgets vertically.
            CarouselSlider(
              // Carousel slider to display banners.
              options: CarouselOptions(viewportFraction: 1, onPageChanged: (index, _) => controller.updatePageIndicator(index)), // Setting carousel options.
              items: controller.banners // Mapping banners to carousel items.
                  .map((banner) => RoundedImage(
                        // Creating rounded image widget for each banner.
                        imageUrl: banner.imageUrl, // Setting image URL.
                        isNetworkImage: true, // Indicating that image is from network.
                        onPressed: () => Get.toNamed(banner.targetScreen), // Navigating to target screen on image press.
                      ))
                  .toList(), // Converting mapped widgets to list.
            ),
            const SizedBox(height: ADSizes.spaceBtwItems), // Adding spacing between items.
            Center(
              // Centering the row of circular indicators.
              child: Obx(
                // Using GetX Obx for reactive UI update based on controller state.
                () => Row(mainAxisSize: MainAxisSize.min, children: [
                  // Row layout for circular indicators.
                  for (int i = 0; i < controller.banners.length; i++) // Looping through banners to create indicators.
                    CircularContainer(
                      // Creating circular indicator for each banner.
                      width: 20, // Setting width of the container.
                      height: 4, // Setting height of the container.
                      margin: const EdgeInsets.only(right: 10), // Setting margin for spacing between indicators.
                      backgroundColor: controller.carouselCurrentIndex.value == i ? ADColors.primary : ADColors.grey, // Setting indicator color based on current index.
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
