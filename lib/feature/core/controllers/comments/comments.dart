import 'package:chef/feature/core/models/comments/comments.dart';
import 'package:chef/utils/dio/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CommentsController extends GetxController {
  static CommentsController get instance => Get.find<CommentsController>();

  //Variables
  final comments = <CommentsModel>[].obs;
  final isLoading = true.obs;
  final firstName = ''.obs;
  final lastName = ''.obs;
  final restaurantName = ''.obs;
  RxInt restaurantId = 0.obs;
  final newComment = ''.obs;
  final deviceStorage = GetStorage();

  void addComment() {
    try {
      if (newComment.value
          .trim()
          .isNotEmpty) {
        Get.back(); // Close the dialog after adding
      }
        // Mock data
        DioHelper.postData(
          endpoint: '/add-comments',
          data: {
            'full_name': '$firstName $lastName',
            'comments': newComment.value,
            'restaurant_id': restaurantId.value,
          },
        )
            .then((value) {
          // Handle success
          getComments();
          isLoading.value = false;
        })
            .catchError((error) {
          // Handle error
          isLoading.value = false;
          Get.snackbar(
            'Error',
            'Something went wrong',
            backgroundColor: Colors.red.shade600,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
            margin: const EdgeInsets.all(10),
            borderRadius: 12,
            icon: const Icon(Icons.error_outline, color: Colors.white),
            shouldIconPulse: true,
          );
        });
      } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Something went wrong',
        backgroundColor: Colors.red.shade600,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(10),
        borderRadius: 12,
        icon: const Icon(Icons.error_outline, color: Colors.white),
        shouldIconPulse: true,
      );
    }
  }

  // Function to get comments
  void getComments() {
    try {
      isLoading.value = true;
        // Mock data
        DioHelper.getData(
              endpoint: ('/comments-restaurant/${restaurantId.value}'),
            )
            .then((value) {
              if (value.data['status'] == true && value.data['data'] != null) {
                comments.value =
                    (value.data['data'] as List)
                        .map((e) => CommentsModel.fromJson(e))
                        .toList();
              }
              isLoading.value = false;
            })
            .catchError((error) {
              // Handle error
              isLoading.value = false;
              Get.snackbar(
                'Error',
                'Something went wrong',
                backgroundColor: Colors.red.shade600,
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 3),
                margin: const EdgeInsets.all(10),
                borderRadius: 12,
                icon: const Icon(Icons.error_outline, color: Colors.white),
                shouldIconPulse: true,
                dismissDirection: DismissDirection.horizontal,
                isDismissible: true,
              );
            });
    } catch (e) {
      // Handle error
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Something went wrong',
        backgroundColor: Colors.red.shade600,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(10),
        borderRadius: 12,
        icon: const Icon(Icons.error_outline, color: Colors.white),
        shouldIconPulse: true,
        dismissDirection: DismissDirection.horizontal,
        isDismissible: true,
      );
    }
  }

  @override
  void onInit() {
    // Get restaurant id and name from arguments
    firstName.value = deviceStorage.read('firstName') ?? 'unknown';
    lastName.value = deviceStorage.read('lastName') ?? 'unknown';
    restaurantId.value = Get.arguments['restaurantId'] ?? 0;
    restaurantName.value = Get.arguments['restaurantName'] ?? 'unknown';
    getComments();
    super.onInit();
  }
}
