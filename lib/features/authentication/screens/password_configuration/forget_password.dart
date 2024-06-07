import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/validators/validation.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:ebazaar/features/authentication/controllers/forget_password/forget_password_controller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ForgetPasswordController.instance;
    return Scaffold(
      appBar: const ADAppBar(showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(ADSizes.defaultSpace),
        child: Column(children: [
          /// Headings
          Text(ADTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: ADSizes.spaceBtwItems),
          Text(ADTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: ADSizes.spaceBtwSections * 2),

          /// Text field
          Form(
            key: controller.forgetPassworFormKey,
            child: TextFormField(
              controller: controller.email,
              validator: Validator.validateEmail,
              decoration: const InputDecoration(labelText: ADTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
            ),
          ),
          const SizedBox(height: ADSizes.spaceBtwItems),

          /// Submit Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(), child: const Text(ADTexts.submit))),
        ]),
      ),
    );
  }
}
