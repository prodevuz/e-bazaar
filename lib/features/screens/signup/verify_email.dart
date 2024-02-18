import 'package:ebazaar/common/widgets/success_screen/success_screen.dart';
import 'package:ebazaar/features/screens/login/login.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                  image:
                      const AssetImage(CustomImages.deliveredEmailIllustration),
                  width: HelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              /// Title & SubTitle
              Text(CustomTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              Text('abdurakhmon278@gmail.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              Text(CustomTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(
                            () => SuccessScreen(
                              image: CustomImages.staticSuccessIllustration,
                              title: CustomTexts.yourAccountCreatedTitle,
                              subTitle: CustomTexts.yourAccountCreatedSubTitle,
                              onPressed: () =>
                                  Get.to(() => const LoginScreen()),
                            ),
                          ),
                      child: const Text(CustomTexts.cContinue))),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(CustomTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
