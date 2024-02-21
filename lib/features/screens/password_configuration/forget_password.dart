import 'package:ebazaar/features/screens/password_configuration/reset_password.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(ADSizes.defaultSpace),
        child: Column(
          children: [
            /// Headings
            Text(ADTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: ADSizes.spaceBtwItems),
            Text(ADTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: ADSizes.spaceBtwSections * 2),

            /// Text field
            TextFormField(decoration: const InputDecoration(labelText: ADTexts.email, prefixIcon: Icon(Iconsax.direct_right))),
            const SizedBox(height: ADSizes.spaceBtwItems),

            /// Submit Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.off(() => const ResetPassword()), child: const Text(ADTexts.submit))),
          ],
        ),
      ),
    );
  }
}
