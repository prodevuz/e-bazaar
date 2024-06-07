import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/validators/validation.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:ebazaar/features/authentication/screens/signup/signup.dart';
import 'package:ebazaar/features/authentication/controllers/login/login_controller.dart';
import 'package:ebazaar/features/authentication/screens/password_configuration/forget_password.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ADSizes.spaceBtwSections),
        child: Obx(
          () => Column(children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => Validator.validateEmail(value),
              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: ADTexts.email),
            ),
            const SizedBox(height: ADSizes.spaceBtwInputFields),
            TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value) => Validator.validateEmptyText("Parol", value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: ADTexts.password,
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  ),
                )),
            const SizedBox(height: ADSizes.spaceBtwInputFields / 2),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.value = value!), const Text(ADTexts.rememberMe)]),
              TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: const Text(ADTexts.forgetPasswordTitle)),
            ]),
            const SizedBox(height: ADSizes.spaceBtwSections),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.emailAndPasswordSignIn(), child: const Text(ADTexts.signIn))),
            const SizedBox(height: ADSizes.spaceBtwItems),
            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(ADTexts.createAccount))),
            const SizedBox(height: ADSizes.spaceBtwSections),
          ]),
        ),
      ),
    );
  }
}
