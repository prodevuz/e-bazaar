import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/features/authentication/screens/login/login.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(ADSizes.defaultSpace),
        child: Column(
          children: [
            /// Image with 60% of screen width
            Image(image: const AssetImage(ADImages.deliveredEmailIllustration), width: HelperFunctions.screenWidth() * 0.6),
            const SizedBox(height: ADSizes.spaceBtwSections),

            /// Title & SubTitle
            Text(ADTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            const SizedBox(height: ADSizes.spaceBtwItems),
            Text(ADTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
            const SizedBox(height: ADSizes.spaceBtwSections),

            /// Submit button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.offAll(() => const LoginScreen()), child: const Text(ADTexts.done))),
            const SizedBox(height: ADSizes.spaceBtwItems),
            SizedBox(width: double.infinity, child: TextButton(onPressed: () {}, child: const Text(ADTexts.resendEmail))),
          ],
        ),
      ),
    );
  }
}
