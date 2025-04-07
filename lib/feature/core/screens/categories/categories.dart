import 'package:chef/common/widgets/card/restaurants_card_horizontal.dart';
import 'package:chef/feature/core/controllers/categories/categories.dart';
import 'package:chef/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesController());
    controller.getCategories();
    return Scaffold(
      appBar: AppBar(title: Text('categories'.tr)),
      body: Obx(
            () => controller.isLoading.value ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: ListView.separated(
              itemCount: controller.categories.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:
                  (_, index) => RestaurantsCardHorizontal(
                    image: controller.categories[index].image!,
                    title: controller.categories[index].title!,
                  ),
              separatorBuilder:
                  (_, index) => SizedBox(height: MySizes.spaceBtwItem),
            ),
          ),
        ),
      ),
    );
  }
}
