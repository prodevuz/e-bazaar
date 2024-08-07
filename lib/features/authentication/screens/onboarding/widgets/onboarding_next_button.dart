import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/device/device_utility.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/features/authentication/controllers/onboarding/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Positioned(
      right: ADSizes.defaultSpace,
      bottom: ADDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(onPressed: () => OnboardingController.instance.nextPage(), style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: dark ? ADColors.primary : Colors.black), child: const Icon(Iconsax.arrow_right_3)),
    );
  }
}
