import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:ebazaar/common/widgets/login_signup/form_divider.dart';
import 'package:ebazaar/common/widgets/login_signup/social_buttons.dart';
import 'package:ebazaar/features/authentication/screens/signup/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ADAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(ADTexts.signUpTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: ADSizes.spaceBtwSections),

              /// Form
              const SignupForm(),
              const SizedBox(height: ADSizes.spaceBtwSections),

              /// Divider
              FormDivider(dividerText: ADTexts.orSignUpWith.capitalize!),
              const SizedBox(height: ADSizes.spaceBtwSections),

              /// Social buttons
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
