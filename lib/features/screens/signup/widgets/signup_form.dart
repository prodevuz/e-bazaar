import 'package:ebazaar/features/screens/signup/verify_email.dart';
import 'package:ebazaar/features/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// Full name
          Row(
            children: [
              Expanded(child: TextFormField(expands: false, decoration: const InputDecoration(labelText: ADTexts.firstName, prefixIcon: Icon(Iconsax.user)))),
              const SizedBox(width: ADSizes.spaceBtwInputFields),
              Expanded(child: TextFormField(expands: false, decoration: const InputDecoration(labelText: ADTexts.lastName, prefixIcon: Icon(Iconsax.user)))),
            ],
          ),
          const SizedBox(height: ADSizes.spaceBtwInputFields),

          /// Username
          TextFormField(expands: false, decoration: const InputDecoration(labelText: ADTexts.username, prefixIcon: Icon(Iconsax.user_edit))),
          const SizedBox(height: ADSizes.spaceBtwInputFields),

          /// Email
          TextFormField(expands: false, decoration: const InputDecoration(labelText: ADTexts.email, prefixIcon: Icon(Iconsax.direct))),
          const SizedBox(height: ADSizes.spaceBtwInputFields),

          /// Phone number
          TextFormField(expands: false, decoration: const InputDecoration(labelText: ADTexts.phoneNo, prefixIcon: Icon(Iconsax.call))),
          const SizedBox(height: ADSizes.spaceBtwInputFields),

          /// Password
          TextFormField(obscureText: true, expands: false, decoration: const InputDecoration(labelText: ADTexts.password, prefixIcon: Icon(Iconsax.password_check), suffixIcon: Icon(Iconsax.eye_slash))),
          const SizedBox(height: ADSizes.spaceBtwInputFields),

          /// Terms&Conditions Checkbox
          const TermsConditionsCheckbox(),
          const SizedBox(height: ADSizes.spaceBtwSections),

          /// Sign Up Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const VerifyEmailScreen()), child: const Text(ADTexts.createAccount))),
        ],
      ),
    );
  }
}
