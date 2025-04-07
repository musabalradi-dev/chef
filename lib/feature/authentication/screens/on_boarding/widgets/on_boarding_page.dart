import 'package:chef/utils/constants/sizes.dart';
import 'package:chef/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MySizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: HelperFunctions.screenWidth() * 0.8,
            height: HelperFunctions.screenHeight() * 0.6,
            image: AssetImage(image),
          ),
          Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
          SizedBox(height: MySizes.spaceBtwItem,),
          Text(subTitle, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}