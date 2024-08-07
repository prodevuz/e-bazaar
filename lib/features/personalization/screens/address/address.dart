import 'package:ebazaar/features/personalization/controllers/address_controller.dart';
import 'package:ebazaar/utils/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/features/personalization/screens/address/add_new_address.dart';
import 'package:ebazaar/features/personalization/screens/address/widgets/single_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ADColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: ADColors.white),
      ),
      appBar: ADAppBar(showBackArrow: true, title: Text("Manzillar", style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ADSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
              // Use key to trigger refresh
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUserAddresses(),
              builder: (context, snapshot) {
                final response = ADCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                if (response != null) return response;

                final addresses = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder: (_, index) => SingleAddress(
                    address: addresses[index],
                    onTap: () => controller.selectAddress(addresses[index]),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
