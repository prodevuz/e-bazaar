import 'package:ebazaar/common/widgets/login_signup/form_divider.dart';
import 'package:ebazaar/common/widgets/login_signup/social_buttons.dart';
import 'package:ebazaar/features/screens/signup/widgets/signup_form.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(CustomTexts.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              /// Form
              const SignupForm(),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              /// Divider

              FormDivider(dividerText: CustomTexts.orSignUpWith.capitalize!),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              /// Social buttons

              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
