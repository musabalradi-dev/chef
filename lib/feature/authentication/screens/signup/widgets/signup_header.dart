import 'package:chef/utils/constants/image_strings.dart';
import 'package:chef/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpHeaderWidget extends StatelessWidget {
  const SignUpHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150.0,
          image: AssetImage(MyImageString.appLogo),),
        SizedBox(height: MySizes.spaceBtwItem,),
        Text('signUpTitle'.tr, style: TextTheme.of(context).headlineMedium,),
        SizedBox(height: MySizes.spaceBtwSection),
      ],
    );
  }
}