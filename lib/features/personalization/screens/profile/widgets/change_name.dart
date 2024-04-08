import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/validators/validation.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/features/personalization/controllers/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: ADAppBar(
        showBackArrow: true,
        title: Text("Ismni o'zgartirish", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(ADSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              "Oson tasdiqlanish uchun haqiqiy ism kiriting. Bu ism turli sahifalarda ko'rinadi.",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: ADSizes.spaceBtwSections),

            /// Text Field and Button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(children: [
                TextFormField(
                  controller: controller.firstName,
                  validator: (value) => Validator.validateEmptyText("Ism", value),
                  expands: false,
                  decoration: const InputDecoration(labelText: ADTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
                const SizedBox(height: ADSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.lastName,
                  validator: (value) => Validator.validateEmptyText("Familya", value),
                  expands: false,
                  decoration: const InputDecoration(labelText: ADTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ]),
            ),
            const SizedBox(height: ADSizes.spaceBtwSections),

            /// Save Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text("Saqlash"))),
          ],
        ),
      ),
    );
  }
}
