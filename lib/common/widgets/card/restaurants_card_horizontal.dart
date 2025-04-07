import 'package:chef/common/styles/shadows.dart';
import 'package:chef/common/widgets/images/rounded_image.dart';
import 'package:chef/common/widgets/shapes/rounded_container.dart';
import 'package:chef/feature/core/screens/categories/categories_details.dart';
import 'package:chef/utils/constants/colors.dart';
import 'package:chef/utils/constants/sizes.dart';
import 'package:chef/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantsCardHorizontal extends StatelessWidget {
  const RestaurantsCardHorizontal({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => CategoriesDetailsScreen(), arguments: {
        'categories': title,
      }),
      child: Container(
        width: 310,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.horizontalProductShadow],
          borderRadius: BorderRadius.circular(MySizes.productImageRadius),
          color: dark ? MyColors.darkerGrey : MyColors.white,
        ),
        child: Row(
          children: [
            RoundedContainer(
              width: 90,
              height: 90,
              padding: EdgeInsets.all(MySizes.sm),
              backgroundColor: dark ? MyColors.dark : MyColors.light,
              child: RoundedImage(imageUrl: image, applyImageRadius: true,),
            ),
            SizedBox(width: MySizes.md),
            Text(
            title.tr,
              style: TextTheme.of(context).titleLarge,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
