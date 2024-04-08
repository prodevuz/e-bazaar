import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/features/authentication/controllers/login/login_controller.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        decoration: BoxDecoration(border: Border.all(color: ADColors.grey), borderRadius: BorderRadius.circular(100)),
        child: IconButton(
          onPressed: () => controller.googleSignIn(),
          icon: const Image(width: ADSizes.iconMd, height: ADSizes.iconMd, image: AssetImage(ADImages.google)),
        ),
      ),
      const SizedBox(width: ADSizes.spaceBtwItems),
      Container(
        decoration: BoxDecoration(border: Border.all(color: ADColors.grey), borderRadius: BorderRadius.circular(100)),
        child: IconButton(
          onPressed: () {},
          icon: const Image(width: ADSizes.iconMd, height: ADSizes.iconMd, image: AssetImage(ADImages.facebook)),
        ),
      ),
    ]);
  }
}
