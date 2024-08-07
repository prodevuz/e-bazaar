import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/features/authentication/controllers/signup/signup_controller.dart';

class TermsConditionsCheckbox extends StatelessWidget {
  const TermsConditionsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = HelperFunctions.isDarkMode(context);

    return Row(children: [
      SizedBox(width: 24, height: 24, child: Obx(() => Checkbox(value: controller.privacyPolicy.value, onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value))),
      const SizedBox(width: ADSizes.spaceBtwItems),
      Flexible(
        child: Text.rich(
          TextSpan(children: [
            TextSpan(text: ADTexts.privacyPolicy, style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark ? ADColors.white : ADColors.primary, decoration: TextDecoration.underline, decorationColor: dark ? ADColors.white : ADColors.primary)),
            TextSpan(text: '${ADTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(text: ADTexts.termsOfUse, style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark ? ADColors.white : ADColors.primary, decoration: TextDecoration.underline, decorationColor: dark ? ADColors.white : ADColors.primary)),
            TextSpan(text: '${ADTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
          ]),
        ),
      ),
    ]);
  }
}
