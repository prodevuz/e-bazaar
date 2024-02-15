import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: CustomColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: CustomSizes.iconMd,
              height: CustomSizes.iconMd,
              image: AssetImage(
                CustomImages.google,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: CustomSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: CustomColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: CustomSizes.iconMd,
              height: CustomSizes.iconMd,
              image: AssetImage(
                CustomImages.facebook,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
