import 'package:ebazaar/features/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:ebazaar/features/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:ebazaar/features/screens/onboarding/widgets/onboarding_page_view.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/features/screens/onboarding/widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          /// Page View

          OnBoardingPageView(),

          /// Skip Button

          OnBoardingSkip(),

          /// Dot Navtigation

          OnBoardingDotNavigation(),

          /// Next Button

          OnBoardingNextButton(),
        ],
      ),
    );
  }
}
