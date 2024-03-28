import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/features/authentication/screens/login/login.dart';
import 'package:ebazaar/common/widgets/success_screen/success_screen.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Get.offAll(const LoginScreen()), icon: const Icon(CupertinoIcons.clear))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(image: const AssetImage(ADImages.deliveredEmailIllustration), width: HelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: ADSizes.spaceBtwSections),

              /// Title & SubTitle
              Text(ADTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: ADSizes.spaceBtwItems),
              Text('abdurakhmon278@gmail.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: ADSizes.spaceBtwItems),
              Text(ADTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: ADSizes.spaceBtwSections),

              /// Buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => SuccessScreen(image: ADImages.staticSuccessIllustration, title: ADTexts.yourAccountCreatedTitle, subTitle: ADTexts.yourAccountCreatedSubTitle, onPressed: () => Get.to(() => const LoginScreen()))), child: const Text(ADTexts.cContinue))),
              const SizedBox(height: ADSizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: () {}, child: const Text(ADTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
