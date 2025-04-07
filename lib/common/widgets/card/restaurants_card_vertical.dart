import 'package:chef/common/styles/shadows.dart';
import 'package:chef/common/widgets/images/rounded_image.dart';
import 'package:chef/common/widgets/shapes/rounded_container.dart';
import 'package:chef/common/widgets/texts/restaurants_title_text.dart';
import 'package:chef/feature/core/screens/details/details.dart';
import 'package:chef/utils/constants/colors.dart';
import 'package:chef/utils/constants/sizes.dart';
import 'package:chef/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class RestaurantsCardVertical extends StatelessWidget {
  const RestaurantsCardVertical({
    super.key,
    required this.id,
    required this.image,
    required this.title,
    this.categories,
    required this.rating,
    this.address,
    required this.description,
  });

  final int id;
  final String image;
  final String title;
  final String? categories;
  final double rating;
  final String? address;
  final String description;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => RestaurantDetailsScreen(), arguments: {
        'id': id,
        'image_url': image,
        'title': title,
        'categories': categories,
        'rating': rating,
        'address': address,
        'description': description,
      }),
      child: Container(
        width: 180,
        padding: EdgeInsetsDirectional.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(MySizes.productImageRadius),
          color: dark ? MyColors.darkGrey : MyColors.white,
        ),
        child: Column(
          children: [
            RoundedContainer(
              height: 180,
              padding: EdgeInsets.all(MySizes.sm),
              backgroundColor: dark ? MyColors.dark : MyColors.light,
              child: Stack(
                children: [
                  // Image
                  RoundedImage(
                    width: double.infinity,
                    height: 180,
                    imageUrl: image,
                    applyImageRadius: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: MySizes.spaceBtwItem / 2),
            // Details
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: MySizes.sm,
                end: MySizes.sm,
                bottom: MySizes.sm,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RestaurantsTitleText(title: title, smallSize: true),
                  SizedBox(height: MySizes.spaceBtwItem / 2),
                  RatingBarIndicator(
                    rating: rating,
                    itemSize: 20,
                    unratedColor: MyColors.grey,
                    itemBuilder:
                        (_, index) =>
                            Icon(Iconsax.star1, color: MyColors.primary),
                  ),
                  Text(
                    description.tr,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextTheme.of(context).labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
