import 'package:ebazaar/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ebazaar/features/authentication/screens/signup/signup.dart';
import 'package:ebazaar/navigation_menu.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ADSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: ADTexts.email)),
            const SizedBox(height: ADSizes.spaceBtwInputFields),
            TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.password_check), labelText: ADTexts.password, suffixIcon: Icon(Iconsax.eye_slash))),
            const SizedBox(height: ADSizes.spaceBtwInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(ADTexts.rememberMe),
                  ],
                ),
                TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: const Text(ADTexts.forgetPasswordTitle)),
              ],
            ),
            const SizedBox(height: ADSizes.spaceBtwSections),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.offAll(() => const NavigationMenu()), child: const Text(ADTexts.signIn))),
            const SizedBox(height: ADSizes.spaceBtwItems),
            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(ADTexts.createAccount))),
            const SizedBox(height: ADSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
