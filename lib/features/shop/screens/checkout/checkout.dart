import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/navigation_menu.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/products/cart/coupon_widget.dart';
import 'package:ebazaar/common/widgets/success_screen/success_screen.dart';
import 'package:ebazaar/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ebazaar/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ebazaar/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ebazaar/features/shop/screens/checkout/widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: ADAppBar(showBackArrow: true, title: Text("Buyurtmani rasmiylashtirish", style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: Column(children: [
            /// Items in Cart
            const CartItems(showAddRemoveButtons: false),
            const SizedBox(height: ADSizes.spaceBtwSections),

            /// Coupon TextField
            const CouponCode(),
            const SizedBox(height: ADSizes.spaceBtwSections),

            /// Billing Section
            RoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(ADSizes.md),
              backgroundColor: dark ? ADColors.black : ADColors.white,
              child: const Column(children: [
                /// Pricing
                BillingAmountSection(),
                SizedBox(height: ADSizes.spaceBtwItems),

                /// Divider
                Divider(),
                SizedBox(height: ADSizes.spaceBtwItems),

                /// Payment Methods
                BillingPaymentSection(),
                SizedBox(height: ADSizes.spaceBtwItems),

                /// Address
                BillingAddressSection(),
              ]),
            ),
          ]),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ADSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: ADImages.successfulPaymentIcon,
              title: "To'lov amalga oshirildi!",
              subTitle: "Buyurtmangiz yaqinda yetkazib beriladi!",
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: const Text("Rasmiylashtirish \$256"),
        ),
      ),
    );
  }
}
