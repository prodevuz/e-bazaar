import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/loaders/animation_loader.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) => showDialog(
        barrierDismissible: false,
        context: Get.overlayContext!, // Use Get.overlayContext to access the overlay context
        builder: (_) => PopScope(
          // Correct the spelling of 'PopScope' to 'SizedBox'
          canPop: false,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: HelperFunctions.isDarkMode(Get.context!) ? ADColors.dark : ADColors.white,
            child: Column(children: [
              const SizedBox(height: 250),
              AnimationLoaderWidget(text: text, animation: animation),
            ]),
          ),
        ),
      );

  static void stopLoading() => Navigator.of(Get.overlayContext!).pop(); // Use Get.overlayContext to access the overlay context
}
