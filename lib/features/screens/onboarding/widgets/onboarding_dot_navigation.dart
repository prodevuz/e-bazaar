import 'package:ebazaar/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/device/device_utility.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = HelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: CustomDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: CustomSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? CustomColors.light : CustomColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
