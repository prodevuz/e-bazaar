import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';


class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: dark ? ADColors.dark : ADColors.white,
      padding: const EdgeInsets.only(top: ADSizes.sm, right: ADSizes.sm, bottom: ADSizes.sm, left: ADSizes.md),
      child: Row(
        children: [
          /// TextField
          const Flexible(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Promokod bormi? Bu yerga kiriting",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
    
          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: dark ? ADColors.white.withOpacity(0.5) : ADColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              child: const Text("Qo'llash"),
            ),
          ),
        ],
      ),
    );
  }
}
