import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: CustomSizes.spaceBtwSections),
        child: Column(
          children: [
            
            /// Email

            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: CustomTexts.email,
              ),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwInputFields,
            ),

            /// Password

            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: CustomTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwInputFields / 2,
            ),

            /// Remember Me and Forget password

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember me

                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(CustomTexts.rememberMe),
                  ],
                ),

                /// Forget password

                TextButton(
                  onPressed: () {},
                  child: const Text(CustomTexts.forgetPasswordTitle),
                ),
              ],
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),

            /// SignIn button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(CustomTexts.signIn),
              ),
            ),

            const SizedBox(
              height: CustomSizes.spaceBtwItems,
            ),

            /// Create account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(CustomTexts.createAccount),
              ),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),
          ],
        ),
      ),
    );
  }
}
