import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/features/shop/models/banner_model.dart';
import 'package:ebazaar/data/services/firebase_storage_service.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Fetches active banners from Firestore
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection("Banners").where('Active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
    } catch (e) {
      rethrow;
    }
  }

  /// Uploads banners to Firestore
  Future<void> uploadDummyBanners(List<BannerModel> banners) async {
    try {
      final storage = ADFirebaseStorageService.instance;

      for (var banner in banners) {
        // Get image data from storage service
        final imageData = await storage.getImageData(banner.imageUrl);
        // Upload image data to Firebase Storage
        final url = await storage.uploadImageData("Banners/Images", imageData, banner.imageUrl.toString());
        // Update banner model with new image URL
        final updatedBanner = banner.copyWith(imageUrl: url);
        // Add updated banner to Firestore
        await _db.collection("Banners").add(updatedBanner.toJson());
      }
    } catch (e) {
      rethrow;
    }
  }
}
