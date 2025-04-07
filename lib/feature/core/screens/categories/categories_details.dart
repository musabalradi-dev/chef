import 'package:chef/common/widgets/card/restaurants_card_vertical.dart';
import 'package:chef/feature/core/controllers/categories/categories_details.dart';
import 'package:chef/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesDetailsScreen extends StatelessWidget {
  const CategoriesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(CategoriesDetailsController());
    return Scaffold(
      appBar: AppBar(title: Text(controller.categoriesName.value),),
      body: Obx(
          ()=> controller.isLoading.value ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(MySizes.defaultSpace),
            child: GridView.builder(
              itemCount: controller.restaurants.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: MySizes.gridViewSpace,
                  crossAxisSpacing: MySizes.gridViewSpace,
                  mainAxisExtent: 280
              ),
              itemBuilder: (_, index) => RestaurantsCardVertical(
                id: controller.restaurants[index].id!,
                image: controller.restaurants[index].image!,
                title: controller.restaurants[index].title!,
                categories: controller.restaurants[index].categories!,
                rating: (controller.restaurants[index].rating!).toDouble(),
                address: controller.restaurants[index].address!,
                description: controller.restaurants[index].description!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
