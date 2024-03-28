import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/icons/circular_icon.dart';
import 'package:ebazaar/common/widgets/images/rounded_image.dart';
import 'package:ebazaar/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return CurvedEdgeWidget(
      child: Container(
        color: dark ? ADColors.darkerGrey : ADColors.light,
        child: Stack(children: [
          /// Main Large Image
          const SizedBox(
            height: 400,
            child: Padding(
              padding: EdgeInsets.all(ADSizes.productImageRadius * 2),
              child: Center(child: Image(image: AssetImage(ADImages.productImage2))),
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
                itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                separatorBuilder: (_, __) => const SizedBox(width: ADSizes.spaceBtwItems),
                itemBuilder: (_, index) => RoundedImage(
                  width: 80,
                  padding: const EdgeInsets.all(ADSizes.sm),
                  backgroundColor: dark ? ADColors.dark : ADColors.white,
                  border: Border.all(color: ADColors.primary),
                  imageUrl: ADImages.productImage2,
                ),
              ),
            ),
          ),

          /// AppBar Icons
          const ADAppBar(showBackArrow: true, actions: [CircularIcon(icon: Iconsax.heart5, color: Colors.red)]),
        ]),
      ),
    );
  }
}
