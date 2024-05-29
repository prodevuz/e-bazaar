import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/features/shop/models/banner_model.dart';
import 'package:ebazaar/data/services/firebase_storage_service.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get All Order related to current User
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection("Banners").where('Active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
    } catch (e) {
      rethrow;
    }
  }

  /// Upload Banners to the Cloud Firestore
  Future<void> uploadDummyBanners(List<BannerModel> banners) async {
    try {
      final storage = Get.put(ADFirebaseStorageService());

      for (var banner in banners) {
        final imageData = await storage.getImageData(banner.imageUrl);
        final url = await storage.uploadImageData("Banners/Images", imageData, banner.imageUrl.toString());

        final updatedBanner = banner.copyWith(imageUrl: url);

        await _db.collection("Banners").add(updatedBanner.toJson());
      }
    } catch (e) {
      rethrow;
    }
  }
}
