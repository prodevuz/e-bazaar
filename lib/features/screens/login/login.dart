import 'package:ebazaar/common/styles/spacing_styles.dart';
import 'package:ebazaar/features/screens/login/widgets/login_divider.dart';
import 'package:ebazaar/features/screens/login/widgets/login_footer.dart';
import 'package:ebazaar/features/screens/login/widgets/login_form.dart';
import 'package:ebazaar/features/screens/login/widgets/login_header.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CustomSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Login header

              LoginHeader(),

              /// Login Form

              LoginForm(),

              /// Divider

              LoginDivider(),
              SizedBox(height: CustomSizes.spaceBtwSections),

              /// Footer

              LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
