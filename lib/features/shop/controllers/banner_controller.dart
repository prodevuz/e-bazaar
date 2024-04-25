import 'package:get/get.dart';
// import 'package:ebazaar/utils/exceptions/exceptions.dart';

class BannerController extends GetxController{
  static BannerController get instance => Get.find();

  /// Variables
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;

  /// Update Indicator
  void updatePageIndicator(index) => carouselCurrentIndex.value = index;

  /// Fetch Banners
  // Future<void> fetchBanners() async {
  //   try {
  //     // Show loader while loading banners
  //     isLoading.value = true;
  //
  //     // Temp
  //     // _bannerRepository.uploadDummyData(ADDummyData.banners);
  //
  //     // Fetch banners from Firestore
  //     final banners = await _bannerRepository.getAllBanners();
  //
  //     // Update the banners list
  //     allBanners.assignAll(banners);
  //
  //     // Filter featured banners
  //     featuredBanners.assignAll(allBanners.where((banner) => banner.isFeatured && banner.parentId.isEmpty).take(8).toList());
  //   } catch (e) {
  //     ADException(e);
  //   } finally {
  //     // Remove Loader
  //     isLoading.value = false;
  //   }
  // }
}