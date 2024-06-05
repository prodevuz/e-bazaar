import 'package:ebazaar/features/personalization/controllers/address_controller.dart';
import 'package:ebazaar/features/personalization/models/address_model.dart';
import 'package:ebazaar/utils/formatters/formatter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.address, required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;

    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;

        return GestureDetector(
          onTap: onTap,
          child: RoundedContainer(
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
            child: Stack(children: [
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  address.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: ADSizes.sm / 2),
                Text(Formatter.formatPhoneNumber(address.phoneNumber), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: ADSizes.sm / 2),
                Text(address.toString(), softWrap: true),
              ]),
            ]),
          ),
        );
      },
    );
  }
}
