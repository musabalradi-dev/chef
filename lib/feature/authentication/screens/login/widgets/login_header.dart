import 'package:chef/utils/constants/image_strings.dart';
import 'package:chef/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MySizes.spaceBtwSection,),
        Image(
          height: 150.0,
          image: AssetImage(MyImageString.appLogo),),
        Text('loginTitle'.tr, style: TextTheme.of(context).headlineMedium,),
        SizedBox(height: MySizes.sm,),
        Text('loginSubTitle'.tr, style: TextTheme.of(context).bodyMedium,),
        SizedBox(height: MySizes.spaceBtwSection),
      ],
    );
  }
}