import 'package:ebazaar/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:ebazaar/features/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return PageView(
      controller: controller.pageController,
      onPageChanged: controller.updatePageIndicator,
      children: const [
        OnBoardingPage(
          image: CustomImages.onBoardingImage1,
          title: CustomTexts.onBoardingTitle1,
          subTitle: CustomTexts.onBoardingSubTitle1,
        ),
        OnBoardingPage(
          image: CustomImages.onBoardingImage2,
          title: CustomTexts.onBoardingTitle2,
          subTitle: CustomTexts.onBoardingSubTitle2,
        ),
        OnBoardingPage(
          image: CustomImages.onBoardingImage3,
          title: CustomTexts.onBoardingTitle3,
          subTitle: CustomTexts.onBoardingSubTitle3,
        ),
      ],
    );
  }
}
