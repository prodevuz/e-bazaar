import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Column(children: [
      SectionHeading(title: "To'lov usuli", buttonTitle: "O'zgartirish", onPressed: () {}),
      const SizedBox(height: ADSizes.spaceBtwItems / 2),
      Row(children: [
        RoundedContainer(
          width: 60,
          height: 35,
          backgroundColor: dark ? ADColors.light : ADColors.white,
          padding: const EdgeInsets.all(ADSizes.sm),
          child: const Image(image: AssetImage(ADImages.facebook), fit: BoxFit.contain),
        ),
        const SizedBox(width: ADSizes.spaceBtwItems / 2),
        Text("PayPal", style: Theme.of(context).textTheme.bodyLarge),
      ]),
    ]);
  }
}
