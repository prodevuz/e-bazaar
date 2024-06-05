import 'package:ebazaar/utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/features/personalization/controllers/address_controller.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      appBar: const ADAppBar(showBackArrow: true, title: Text("Yangi manzil qo'shish")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(children: [
              TextFormField(
                controller: controller.name,
                validator: (value) => Validator.validateEmptyText("Ism", value),
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: "Ism"),
              ),
              const SizedBox(height: ADSizes.spaceBtwInputFields),
              TextFormField(
                controller: controller.phoneNumber,
                validator: Validator.validatePhoneNumber,
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: "Telefon raqam"),
              ),
              const SizedBox(height: ADSizes.spaceBtwInputFields),
              Row(children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.region,
                    validator: (value) => Validator.validateEmptyText("Viloyat", value),
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: "Viloyat"),
                  ),
                ),
                const SizedBox(width: ADSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: controller.city,
                    validator: (value) => Validator.validateEmptyText("Shahar/Tuman", value),
                    decoration:
                        const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: "Shahar yoki tuman"),
                  ),
                ),
              ]),
              const SizedBox(height: ADSizes.spaceBtwInputFields),
              Row(children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.street,
                    validator: (value) => Validator.validateEmptyText("Ko'cha", value),
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: "Ko'cha"),
                  ),
                ),
                const SizedBox(width: ADSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: controller.postalCode,
                    validator: (value) => Validator.validateEmptyText("Po'chta indeksi", value),
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: "Po'chta indeksi"),
                  ),
                ),
              ]),
              const SizedBox(height: ADSizes.spaceBtwInputFields),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.addNewAddress(),
                  child: const Text("Saqlash"),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
