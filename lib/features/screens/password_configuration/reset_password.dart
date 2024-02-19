import 'package:ebazaar/features/screens/login/login.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(
          children: [
            /// Image with 60% of screen width
            Image(
                image:
                    const AssetImage(CustomImages.deliveredEmailIllustration),
                width: HelperFunctions.screenWidth() * 0.6),
            const SizedBox(height: CustomSizes.spaceBtwSections),

            /// Title & SubTitle
            Text(CustomTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            Text(CustomTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: CustomSizes.spaceBtwSections),

            /// Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.offAll(() => const LoginScreen()),
                child: const Text(CustomTexts.done),
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: const Text(CustomTexts.resendEmail),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
