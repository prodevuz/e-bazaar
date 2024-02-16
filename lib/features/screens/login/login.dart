import 'package:ebazaar/common/styles/spacing_styles.dart';
import 'package:ebazaar/common/widgets/login_signup/form_divider.dart';
import 'package:ebazaar/common/widgets/login_signup/social_buttons.dart';
import 'package:ebazaar/features/screens/login/widgets/login_form.dart';
import 'package:ebazaar/features/screens/login/widgets/login_header.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CustomSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Login header

              const LoginHeader(),

              /// Login Form

              const LoginForm(),

              /// Divider

              FormDivider(dividerText: CustomTexts.orSignInWith.capitalize!),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              /// Footer

              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
