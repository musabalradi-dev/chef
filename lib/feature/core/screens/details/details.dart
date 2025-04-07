import 'package:chef/common/widgets/icons/circular_icon.dart';
import 'package:chef/common/widgets/texts/section_heading.dart';
import 'package:chef/feature/core/controllers/details/details.dart';
import 'package:chef/feature/core/screens/comments/comments.dart';
import 'package:chef/utils/constants/colors.dart';
import 'package:chef/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title.value),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.star1),
            onPressed: () => controller.addRating(),
          ),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              // Image
              Stack(
                children: [
                  Image(
                    width: double.infinity,
                    height: 400.0,
                    fit: BoxFit.cover,
                    image: NetworkImage(controller.image.value),
                  ),

                  // Icon Favorites
                  PositionedDirectional(
                    bottom: 20,
                    start: 10,
                    child: CircularIcon(
                      onPressed:
                          () => controller.toggleFavorite(
                            controller.id.value.toString(),
                          ),
                      icon:
                          controller.isFavorite(controller.id.value.toString())
                              ? Iconsax.heart5
                              : Iconsax.heart,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.all(MySizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeading(title: 'rating', showActionButton: false),
                    GestureDetector(
                      onTap: () {},
                      child: RatingBarIndicator(
                        rating: controller.rating.value,
                        itemSize: 20,
                        unratedColor: MyColors.grey,
                        itemBuilder:
                            (_, index) =>
                                Icon(Iconsax.star1, color: MyColors.primary),
                      ),
                    ),
                    SizedBox(height: MySizes.spaceBtwItem),
                    SectionHeading(
                      title: 'address'.tr,
                      showActionButton: false,
                    ),
                    SizedBox(height: MySizes.spaceBtwItem),
                    Container(
                      padding: EdgeInsets.all(MySizes.sm),
                      decoration: BoxDecoration(
                        color: MyColors.primary,
                        borderRadius: BorderRadius.circular(MySizes.sm),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Iconsax.location,
                            color: MyColors.white,
                            size: MySizes.iconSm,
                          ),
                          SizedBox(width: MySizes.sm),
                          Expanded(
                            child: Text(
                              controller.address.value,
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .apply(color: MyColors.white),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MySizes.spaceBtwItem),
                    SectionHeading(
                      title: 'description',
                      showActionButton: false,
                    ),
                    SizedBox(height: MySizes.spaceBtwItem),
                    Text(
                      controller.description.value,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: MySizes.spaceBtwItem),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your action here
                          Get.to(
                            () => CommentsScreen(),
                            arguments: {
                              'restaurantId': controller.id.value,
                              'restaurantName': controller.title.value,
                            },
                          );
                        },
                        child: Text(
                          'comments'.tr,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge!.apply(color: MyColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
