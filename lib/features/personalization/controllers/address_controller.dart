import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/helpers/network_manager.dart';
import 'package:ebazaar/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/loaders/loaders.dart';
import 'package:ebazaar/utils/exceptions/exceptions.dart';
import 'package:ebazaar/data/repositories/address/address_repository.dart';
import 'package:ebazaar/features/personalization/models/address_model.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  /// Variables
  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final AddressRepository repository = Get.put(AddressRepository());

  final name = TextEditingController();
  final phoneNumber = TextEditingController(text: "+998 ");
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final region = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  /// Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await repository.fetchUserAddresses();

      selectedAddress.value =
          addresses.firstWhere((element) => element.selectedAddress, orElse: () => AddressModel.empty());

      return addresses;
    } catch (e) {
      ADLoaders.errorSnackBar(title: "Manzillarni yuklab bo'lmadi", message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: ()async => false,
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const CircularProgressIndicator(),
      );
      // Clear the selected field
      if (selectedAddress.value.id.isNotEmpty) await repository.updateSelectedField(selectedAddress.value.id, false);

      // Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the "selected" field to true for the newly selected address
      await repository.updateSelectedField(selectedAddress.value.id, true);
   
      Get.back();
    } catch (e) {
      ADException(e);
    }
  }

  Future addNewAddress() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog("Manzil saqlanmoqda...", ADImages.docerAnimation);

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!addressFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Save address data
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: "+998${phoneNumber.text.trim()}",
        street: street.text.trim(),
        city: city.text.trim(),
        region: region.text.trim(),
        postalCode: postalCode.text.trim(),
        selectedAddress: true,
      );
      final id = await repository.addAddress(address);

      // Update selected address status
      address.id = id;
      await selectedAddress(address);

      // Remove loader
      FullScreenLoader.stopLoading();

      // Show success message
      ADLoaders.successSnackBar(title: "Tabriklaymiz!", message: "Manzilingiz muvoffaqiyatli saqlandi");

      // Refresh address data
      refreshData.toggle();

      // Reset fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // Remove loader
      FullScreenLoader.stopLoading();
      ADLoaders.errorSnackBar(title: "Manzil topilmadi", message: e.toString());
    }
  }

  /// Function to reset form fields
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    region.clear();
    addressFormKey.currentState?.reset();
  }
}
