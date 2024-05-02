import 'package:ebazaar/data/repositories/banners/banner_repository.dart';
import 'package:get/get.dart';
import 'package:ebazaar/utils/exceptions/exceptions.dart';
import 'package:ebazaar/features/shop/models/banner_model.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  /// Variables
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Update Page Navigation Dots
  void updatePageIndicator(index) => carouselCurrentIndex.value = index;

  // / Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // Show loader while loading banners
      isLoading.value = true;

      // Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);
    } catch (e) {
      ADException(e);
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  /// Empty Temp
  BannerModel empty = BannerModel(active: false, imageUrl: '', targetScreen: '');
}
