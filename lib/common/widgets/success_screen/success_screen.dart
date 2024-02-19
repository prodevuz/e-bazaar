import 'package:ebazaar/common/styles/spacing_styles.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });
  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CustomSpacingStyles.paddingWithAppBarHeight * 2,
          child: Column(children: [
            /// Image
            Image(
                image: AssetImage(image),
                width: HelperFunctions.screenWidth() * 0.6),
            const SizedBox(height: CustomSizes.spaceBtwSections),

            /// Title & SubTitle
            Text(title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            Text(subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: CustomSizes.spaceBtwSections),

            /// Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                child: const Text(CustomTexts.cContinue),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
