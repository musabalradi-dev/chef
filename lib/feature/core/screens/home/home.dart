import 'package:chef/common/styles/spacing_styles.dart';
import 'package:chef/common/widgets/card/restaurants_card_vertical.dart';
import 'package:chef/common/widgets/images/rounded_image.dart';
import 'package:chef/common/widgets/shapes/rounded_container.dart';
import 'package:chef/common/widgets/texts/section_heading.dart';
import 'package:chef/feature/core/controllers/home/home.dart';
import 'package:chef/feature/core/screens/home/widgets/home_header.dart';
import 'package:chef/utils/constants/colors.dart';
import 'package:chef/utils/constants/sizes.dart';
import 'package:chef/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Obx(
        () =>
            controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                  child: Padding(
                    padding: SpacingStyles.paddingWithAppBarHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        HomeHeaderWidget(),
                        SizedBox(height: MySizes.spaceBtwSection),

                        // Banner
                        RoundedContainer(
                          width: double.infinity,
                          height: 200,
                          backgroundColor:
                              dark ? MyColors.dark : MyColors.light,
                          child: RoundedImage(
                            imageUrl: 'https://cnn-arabic-images.cnn.io/cloudinary/image/upload/w_1920,c_scale,q_auto/cnnarabic/2023/06/21/images/243418.avif',
                          ),
                        ),
                        SizedBox(height: MySizes.spaceBtwSection),
                        // List
                        SectionHeading(
                          title: 'restaurantList',
                          showActionButton: false,
                        ),
                        SizedBox(height: MySizes.spaceBtwItem),
                        GridView.builder(
                          itemCount: controller.restaurants.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: MySizes.gridViewSpace,
                                crossAxisSpacing: MySizes.gridViewSpace,
                                mainAxisExtent: 280,
                              ),
                          itemBuilder:
                              (_, index) => RestaurantsCardVertical(
                                id: controller.restaurants[index].id!,
                                image: controller.restaurants[index].image!,
                                title: controller.restaurants[index].title!,
                                categories: controller.restaurants[index].categories!,
                                rating: (controller.restaurants[index].rating!).toDouble(),
                                address: controller.restaurants[index].address!,
                                description: controller.restaurants[index].description!,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
      ),
    );
  }
}
