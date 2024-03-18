import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    required this.selectedAddress,
  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return RoundedContainer(
      padding: const EdgeInsets.all(ADSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? ADColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? ADColors.darkerGrey
              : ADColors.grey,
      margin: const EdgeInsets.only(bottom: ADSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? ADColors.light
                      : ADColors.dark.withOpacity(0.6)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "AbdurRohman Davron",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: ADSizes.sm / 2),
              const Text("+998 (91) 555-08-95", maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: ADSizes.sm / 2),
              const Text("Chinor 118, Soyguzar, Urgut, Samarkand, 141608, Uzbekistan", softWrap: true),
            ],
          ),
        ],
      ),
    );
  }
}
