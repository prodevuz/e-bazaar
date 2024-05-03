import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/validators/validation.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:ebazaar/features/personalization/controllers/user_controller.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text("Qayta autentifikatsiya qilish")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              /// Email
              TextFormField(
                controller: controller.verifyEmail,
                validator: Validator.validateEmail,
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: ADTexts.email),
              ),
              const SizedBox(height: ADSizes.spaceBtwInputFields),

              /// Password
              Obx(
                () => TextFormField(
                  obscureText: controller.hidePassword.value,
                  controller: controller.verifyPassword,
                  validator: (value) => Validator.validateEmptyText("Parol", value),
                  decoration: InputDecoration(
                    labelText: ADTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                      icon: controller.hidePassword.value ? const Icon(Iconsax.eye_slash) : const Icon(Iconsax.eye),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: ADSizes.spaceBtwSections),

              /// Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndPasswordUser(), child: const Text("Tasdiqlash")),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
