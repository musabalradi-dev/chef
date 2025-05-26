import 'package:chef/navigation_menu.dart';
import 'package:chef/utils/dio/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // variables
  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final deviceStorage = GetStorage();

  login({required String email, required String password}) async {
    try {

      // Show loading indicator
      isLoading.value = true;

      // Validate the form
      if (!loginFormKey.currentState!.validate()) return;

      // Simulate a network request
      await Future.delayed(const Duration(seconds: 2));

      // Make a POST request to the login endpoint
      DioHelper.postData(
            endpoint: '/login',
            data: {
              'email': email.trim(),
              'password': password.trim(),
            },
          )
          .then((value) {
            if (value.data['status'] == true) {
              // Check if the user has accepted the privacy policy
              if (privacyPolicy.value == true) {
                // Store the token in local storage
                deviceStorage.write('token', value.data['token']);
              }
              // Store the First Name data in local storage
              deviceStorage.write('firstName', value.data['data']['first_name'],);
              // Store the Last Name data in local storage
              deviceStorage.write('lastName', value.data['data']['last_name']);
              // Store the Last Name data in local storage
              deviceStorage.write('emailAddress', value.data['data']['email']);
              // Store the user ID in local storage
              deviceStorage.write('userId', value.data['data']['id']);

              // Navigate to the home screen
              Get.off(() => NavigationMenu());
              // Show a success message
              Get.snackbar(
                'success'.tr,
                'loginSuccessMessage'.tr,
                backgroundColor: Colors.green.shade600,
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM,
                duration: Duration(seconds: 3),
                margin: const EdgeInsets.all(10),
                borderRadius: 12,
                icon: const Icon(Icons.check_circle, color: Colors.white),
                shouldIconPulse: true,
                dismissDirection: DismissDirection.horizontal,
                isDismissible: true,
                forwardAnimationCurve: Curves.easeOutBack,
              );
            } else {
              // Show an error message
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
            }
          })
          .catchError((error) {
            // Handle any errors that occur during the login process
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

      isLoading.value = false;
    } catch (error) {
      // Handle any errors that occur during the login process
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
      // Hide loading indicator
      isLoading.value = false;
    }
  }
}
