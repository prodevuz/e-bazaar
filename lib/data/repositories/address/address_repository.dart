import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/features/personalization/models/address_model.dart';
import 'package:ebazaar/data/repositories/authentication/authentication_repository.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) throw "Foydalanuvchi ma'lumotlarini topib bo'lmadi. Keyinroq urinib ko'ring!";

      final result = await _db.collection("Users").doc(userId).collection("Addresses").get();
      return result.docs.map((documentSnapshot) => AddressModel.fromDocumentSnapshot(documentSnapshot)).toList();
    } catch (e) {
      throw "Manzillarni yuklashda nimadir xato ketdi.";
    }
  }

  /// Clear the "selected" field for all addresses
  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .doc(addressId)
          .update({"SelectedAddress": selected});
    } catch (e) {
      throw "Manzillarni tanlab bo'lmadi.";
    }
  }

  /// Store new user order
  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final currentAddress = await _db.collection("Users").doc(userId).collection("Addresses").add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw "Manzil ma'lumotlarini saqlashdi nimadi xato ketdi.";
    }
  }
}
