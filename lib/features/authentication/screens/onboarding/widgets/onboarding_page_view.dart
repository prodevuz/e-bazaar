import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ebazaar/features/authentication/controllers/onboarding/onboarding_controller.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return PageView(controller: controller.pageController, onPageChanged: controller.updatePageIndicator, children: const [
      OnBoardingPage(image: ADImages.onBoardingImage1, title: ADTexts.onBoardingTitle1, subTitle: ADTexts.onBoardingSubTitle1),
      OnBoardingPage(image: ADImages.onBoardingImage2, title: ADTexts.onBoardingTitle2, subTitle: ADTexts.onBoardingSubTitle2),
      OnBoardingPage(image: ADImages.onBoardingImage3, title: ADTexts.onBoardingTitle3, subTitle: ADTexts.onBoardingSubTitle3),
    ]);
  }
}
