import 'package:chef/feature/authentication/controllers/on_boarding/on_boarding.dart';
import 'package:chef/utils/constants/colors.dart';
import 'package:chef/utils/constants/sizes.dart';
import 'package:chef/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: DeviceUtils.getBottomNavigationBarHeight() + 25,
      left: MySizes.defaultSpace,
      child: SmoothPageIndicator(
        effect: ExpandingDotsEffect(
          activeDotColor: MyColors.primary,
          dotHeight: 6,
        ),
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
      ),
    );
  }
}