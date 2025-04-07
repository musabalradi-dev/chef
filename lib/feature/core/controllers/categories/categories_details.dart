import 'package:chef/feature/core/models/restaurants/restaurants.dart';
import 'package:flutter/material.dart';
import 'package:chef/utils/dio/dio_helper.dart';
import 'package:get/get.dart';

class CategoriesDetailsController extends GetxController {
  // todo: Variables
  final restaurants = <RestaurantsModel>[].obs;
  final isLoading = true.obs;
  final categoriesName = ''.obs;

  void getRestaurantsCategories() {
    try {
      isLoading.value = true;

      DioHelper.getData(
            endpoint: '/restaurants-categories/${categoriesName.value}',
          )
          .then((value) {
            if (value.data['status'] == true && value.data['data'] != null) {
              restaurants.value =
                  (value.data['data'] as List)
                      .map((e) => RestaurantsModel.fromJson(e))
                      .toList();
            }
            isLoading.value = false;
          })
          .catchError((error) {
            isLoading.value = false;
            // Show error message
            Get.snackbar(
              'error'.tr,
              'somethingWentWrong'.tr,
              backgroundColor: Colors.red.shade600,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM,
              duration: Duration(seconds: 3),
              margin: const EdgeInsets.all(10),
              borderRadius: 12,
              icon: const Icon(Icons.error_outline, color: Colors.white),
              shouldIconPulse: true,
              dismissDirection: DismissDirection.horizontal,
              isDismissible: true,
              forwardAnimationCurve: Curves.easeOutBack,
            );
          });
    } catch (error) {
      isLoading.value = false;
      // Show error message
      Get.snackbar(
        'error'.tr,
        'somethingWentWrong'.tr,
        backgroundColor: Colors.red.shade600,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        margin: const EdgeInsets.all(10),
        borderRadius: 12,
        icon: const Icon(Icons.error_outline, color: Colors.white),
        shouldIconPulse: true,
        dismissDirection: DismissDirection.horizontal,
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // Get the arguments passed from the previous screen
    categoriesName.value = Get.arguments['categories'];
    getRestaurantsCategories();
    super.onInit();
  }
}
