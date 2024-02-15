import 'package:ebazaar/features/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}
