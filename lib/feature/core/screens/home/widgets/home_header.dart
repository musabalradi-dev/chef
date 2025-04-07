import 'package:chef/feature/core/controllers/home/home.dart';
import 'package:chef/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(HomeController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MySizes.spaceBtwItem,),
        Text('homeTitle'.tr, style: TextTheme.of(context).headlineMedium,),
        SizedBox(height: MySizes.sm,),
        Text('${controller.firstName.value} ${controller.lastName.value}', style: TextTheme.of(context).bodyMedium,),
      ],
    );
  }
}