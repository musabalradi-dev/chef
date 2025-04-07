import 'package:chef/feature/core/models/restaurants/restaurants.dart';
import 'package:chef/utils/dio/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  // todo: Variables
  final isLoading = true.obs;
  final deviceStorage = GetStorage();
  final firstName = ''.obs;
  final lastName = ''.obs;
  final restaurants = <RestaurantsModel>[].obs;

  // todo: Functions Get All Restaurants
  getAllRestaurants() async {
    try {
      DioHelper.getData(endpoint: '/restaurants-all')
          .then((value) {
            if (value.data['status'] == true && value.data['data'] != null) {
              restaurants.value =
                  (value.data['data'] as List)
                      .map((e) => RestaurantsModel.fromJson(e))
                      .toList();
              isLoading.value = false;
            }else{
              // todo: Handle Error
              Get.snackbar(
                'warning'.tr,
                'somethingWentWrong'.tr,
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.orange,
                colorText: Colors.white,
              );
            }
          })
          .catchError((error) {
            // todo: Is Loading Stop
            isLoading.value = false;

            // todo: Handle Error
            Get.snackbar(
              'error'.tr,
              'somethingWentWrong'.tr,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          });
    } catch (error) {
      // todo: Is Loading Stop
      isLoading.value = false;

      // todo: Handle Error
      Get.snackbar(
        'error'.tr,
        'somethingWentWrong'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      // todo: Is Loading Stop
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    firstName.value = deviceStorage.read('firstName') ?? '';
    lastName.value = deviceStorage.read('lastName') ?? '';
    getAllRestaurants();
    super.onInit();
  }
}
