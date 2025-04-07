import 'package:chef/utils/dio/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetailsController extends GetxController {
  static DetailsController get instance => Get.find();

  RxInt id = 0.obs;
  final image = ''.obs;
  final title = ''.obs;
  final categories = ''.obs;
  final rating = 0.0.obs;
  final address = ''.obs;
  final description = ''.obs;

  // final isFavorites = false.obs;
  final _favorites = <String>[].obs;
  final deviceStorage = GetStorage();

  List<String> get favorites => _favorites;

  addRating() {
    try {
      DioHelper.postData(
            endpoint: 'update-rating/${id.value}',
            data: {'rating': (rating.value + 0.1).toDouble()},
          )
          .then((value) {
            Get.snackbar(
              'success'.tr,
              'RatingSuccessMessage'.tr,
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
          })
          .catchError((error) {
            print(error.toString());
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
    } finally {}
  }

  // Function to get the favorites list
  List<String> getFavorites() {
    return _favorites;
  }

  @override
  void onInit() {
    // Initialize the controller with arguments passed from the previous screen
    id.value = Get.arguments['id'];
    image.value = Get.arguments['image_url'];
    title.value = Get.arguments['title'];
    categories.value = Get.arguments['categories'];
    rating.value = Get.arguments['rating'];
    address.value = Get.arguments['address'];
    description.value = Get.arguments['description'];
    super.onInit();

    // Load favorites from storage when controller initializes
    final storedFavorites = deviceStorage.read<List>('favorites');
    if (storedFavorites != null) {
      _favorites.assignAll(storedFavorites.cast<String>());
    }

    // Listen to changes in favorites and save to storage
    ever(_favorites, (List<String> value) {
      deviceStorage.write('favorites', value);
    });
  }

  bool isFavorite(String id) {
    return _favorites.contains(id);
  }

  void toggleFavorite(String id) {
    if (_favorites.contains(id)) {
      _favorites.remove(id);
    } else {
      _favorites.add(id);
    }
  }
}
