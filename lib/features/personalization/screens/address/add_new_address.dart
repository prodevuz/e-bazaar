import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ADAppBar(showBackArrow: true, title: Text("Yangi manzil qo'shish")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: "Ism"),
                ),
                const SizedBox(height: ADSizes.spaceBtwInputFields),
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: "Telefon raqam"),
                ),
                const SizedBox(height: ADSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: "Ko'cha"))),
                    const SizedBox(width: ADSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: "Po'chta indeksi"))),
                  ],
                ),
                const SizedBox(height: ADSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: "Shahar"))),
                    const SizedBox(width: ADSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: "Viloyat"))),
                  ],
                ),
                const SizedBox(height: ADSizes.spaceBtwInputFields),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: "Davlat")),
                const SizedBox(height: ADSizes.defaultSpace),
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text("Saqlash"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
