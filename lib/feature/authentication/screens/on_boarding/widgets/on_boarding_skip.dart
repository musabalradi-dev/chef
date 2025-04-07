import 'package:chef/feature/authentication/controllers/on_boarding/on_boarding.dart';
import 'package:chef/utils/constants/sizes.dart';
import 'package:chef/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: DeviceUtils.getAppBarHeight(),
        right: MySizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: Text('skip'.tr),
        ));
  }
}
