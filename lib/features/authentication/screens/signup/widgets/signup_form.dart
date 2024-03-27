import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/validators/validation.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:ebazaar/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ebazaar/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// Full name
          Row(
            children: [
              Expanded(child: TextFormField(controller: controller.firstName, validator: (value) => Validator.validateEmptyText("First Name", value), expands: false, decoration: const InputDecoration(labelText: ADTexts.firstName, prefixIcon: Icon(Iconsax.user)))),
              const SizedBox(width: ADSizes.spaceBtwInputFields),
              Expanded(child: TextFormField(controller: controller.lastName, validator: (value) => Validator.validateEmptyText("Last Name", value), expands: false, decoration: const InputDecoration(labelText: ADTexts.lastName, prefixIcon: Icon(Iconsax.user)))),
            ],
          ),
          const SizedBox(height: ADSizes.spaceBtwInputFields),

          /// Username
          TextFormField(controller: controller.username, validator: (value) => Validator.validateEmptyText("Username", value), expands: false, decoration: const InputDecoration(labelText: ADTexts.username, prefixIcon: Icon(Iconsax.user_edit))),
          const SizedBox(height: ADSizes.spaceBtwInputFields),

          /// Email
          TextFormField(controller: controller.email, validator: (value) => Validator.validateEmail(value), expands: false, decoration: const InputDecoration(labelText: ADTexts.email, prefixIcon: Icon(Iconsax.direct))),
          const SizedBox(height: ADSizes.spaceBtwInputFields),

          /// Phone number
          TextFormField(controller: controller.phoneNumber, validator: (value) => Validator.validatePhoneNumber(value), expands: false, decoration: const InputDecoration(labelText: ADTexts.phoneNo, prefixIcon: Icon(Iconsax.call))),
          const SizedBox(height: ADSizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              validator: (value) => Validator.validatePassword(value),
              expands: false,
              decoration: InputDecoration(
                labelText: ADTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: ADSizes.spaceBtwInputFields),

          /// Terms & Conditions Checkbox
          const TermsConditionsCheckbox(),
          const SizedBox(height: ADSizes.spaceBtwSections),

          /// Sign Up Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.signup(), child: const Text(ADTexts.createAccount))),
        ],
      ),
    );
  }
}
