import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/routes/app_routes.dart';
import 'package:ebazaar/utils/theme/theme.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/bindings/general_bindings.dart';
import 'package:ebazaar/features/personalization/controllers/theme_mode_controller.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ThemeModeController());

    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: controller.themeMode.value,
          initialBinding: GeneralBindings(),
          theme: ADTheme.lightTheme,
          darkTheme: ADTheme.darkTheme,
          getPages: AppRoutes.pages,
          home: const Scaffold(
            backgroundColor: ADColors.primary,
            body: Center(child: CircularProgressIndicator(color: ADColors.white)),
          ),
        ),
    );
  }
}
