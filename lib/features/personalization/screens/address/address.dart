import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/features/personalization/screens/address/add_new_address.dart';
import 'package:ebazaar/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ADColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: ADColors.white),
      ),
      appBar: ADAppBar(
        showBackArrow: true,
        title: Text("Manzillar", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ADSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(selectedAddress: false),
              SingleAddress(selectedAddress: true),
            ],
          ),
        ),
      ),
    );
  }
}
