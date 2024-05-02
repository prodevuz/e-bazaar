import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/features/shop/models/banner_model.dart';

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
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    _db;
  }
}
