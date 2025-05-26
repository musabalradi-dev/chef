import 'package:chef/feature/authentication/controllers/on_boarding/on_boarding.dart';
import 'package:chef/feature/authentication/screens/on_boarding/widgets/on_boarding_dot_navigation.dart';
import 'package:chef/feature/authentication/screens/on_boarding/widgets/on_boarding_next_button.dart';
import 'package:chef/feature/authentication/screens/on_boarding/widgets/on_boarding_page.dart';
import 'package:chef/feature/authentication/screens/on_boarding/widgets/on_boarding_skip.dart';
import 'package:chef/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable Page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: MyImageString.onBoardingImage1,
                title: 'onboardingTitle1'.tr,
                subTitle: 'onboardingSubTitle1'.tr,
              ),
              OnBoardingPage(
                image: MyImageString.onBoardingImage2,
                title: 'onboardingTitle2'.tr,
                subTitle: 'onboardingSubTitle2'.tr,
              ),
              OnBoardingPage(
                image: MyImageString.onBoardingImage3,
                title: 'onboardingTitle3'.tr,
                subTitle: 'onboardingSubTitle3'.tr,
              ),
            ],
          ),

          // Skip Button
          OnBoardingSkip(),

          // Dot Navigation SmoothPageIndicator
          OnBoardingDotNavigation(),

          // Circular Button
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}
