import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/utils/logging/logger.dart';

class BannerModel {
  final String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({required this.imageUrl, required this.targetScreen, required this.active});

  BannerModel copyWith({String? imageUrl, String? targetScreen, bool? active}) {
    LoggerHelper.info("Called BannerModel.copyWith()");
    return BannerModel(
      imageUrl: imageUrl ?? this.imageUrl,
      targetScreen: targetScreen ?? this.targetScreen,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toJson() => {
        "ImageUrl": imageUrl,
        "TargetScreen": targetScreen,
        "Active": active,
      };

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      imageUrl: data["ImageUrl"] ?? '',
      targetScreen: data["TargetScreen"] ?? '',
      active: data["Active"] ?? false,
    );
  }
}
