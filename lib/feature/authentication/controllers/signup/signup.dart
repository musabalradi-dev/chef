import 'package:chef/navigation_menu.dart';
import 'package:chef/utils/dio/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  final hiddenPassword = true.obs;
  final deviceStorage = GetStorage();

  void signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      // Show loading indicator
      isLoading.value = true;

      // Validate form
      if (!signUpFormKey.currentState!.validate()) return;

      // Simulate a network request
      await Future.delayed(const Duration(seconds: 2));

      // Make a POST request to the sign-up endpoint
      DioHelper.postData(
            endpoint: '/register',
            data: {
              'first_name': firstName,
              'last_name': lastName,
              'email': email,
              'password': password,
            },
          )
          .then((value) {
            if (value.data['status'] == true) {
              // Store the token in local storage
              deviceStorage.write('token', value.data['token']);
              // Store the user ID in local storage
              deviceStorage.write('userId', value.data['data']['id']);
              // Store the First Name data in local storage
              deviceStorage.write('firstName', value.data['data']['first_name']);
              // Store the Last Name data in local storage
              deviceStorage.write('lastName', value.data['data']['last_name']);
              // Store the Last Name data in local storage
              deviceStorage.write('emailAddress', value.data['data']['email']);

              // Navigate to the home screen
              Get.off(() => NavigationMenu());

              // Show a success message
              Get.snackbar(
                'success'.tr,
                'signUpSuccessMessage'.tr,
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
            } else {
              // Show an error message
              Get.snackbar(
                'error'.tr,
                value.data['message'].toString(),
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            }
          })
          .catchError((error) {
            // Handle any errors that occur during the sign-up process
            isLoading.value = false;
            Get.snackbar(
              'error'.tr,
              error.toString(),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          });
    } catch (error) {
      // Handle any errors that occur during the sign-up process
      isLoading.value = false;
      Get.snackbar(
        'error'.tr,
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      // Hide loading indicator
      isLoading.value = false;
    }
  }
}
