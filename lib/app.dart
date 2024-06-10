import 'package:get/get.dart'; // Importing GetX package for state management and routing
import 'package:flutter/material.dart'; // Importing Flutter's material design package
import 'package:ebazaar/routes/app_routes.dart'; // Importing application routes
import 'package:ebazaar/utils/theme/theme.dart'; // Importing theme utilities
import 'package:ebazaar/utils/constants/colors.dart'; // Importing color constants
import 'package:ebazaar/bindings/general_bindings.dart'; // Importing general bindings for dependency injection
import 'package:ebazaar/features/personalization/controllers/theme_mode_controller.dart'; // Importing theme mode controller

/// Main app widget extending StatelessWidget
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX theme mode controller
    final controller = Get.put(ThemeModeController());

    return Obx(
      () => GetMaterialApp(
        getPages: AppRoutes.pages, // Setting up the app pages
        theme: ADTheme.lightTheme, // Setting light theme
        darkTheme: ADTheme.darkTheme, // Setting dark theme
        initialBinding: GeneralBindings(), // Initial binding for dependency injection
        debugShowCheckedModeBanner: false, // Disabling debug banner
        themeMode: controller.themeMode.value, // Setting the theme mode from the controller
        home: const Scaffold(
          backgroundColor: ADColors.primary,
          body: Center(child: CircularProgressIndicator(color: ADColors.white)),
        ),
      ),
    );
  }
}
