import 'package:chef/feature/core/models/categories/categories.dart';
import 'package:chef/utils/dio/dio_helper.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();

  // Variables
  final categories = <CategoriesModel>[].obs;
  final isLoading = true.obs;

  getCategories() async {
    try {
      isLoading.value = true;
      // todo: Get categories
      DioHelper.getData(endpoint: '/categories-all').then((value) {
        if (value.data['status'] == true && value.data['data'] != null) {
          categories.value =
              (value.data['data'] as List)
                  .map((e) => CategoriesModel.fromJson(e))
                  .toList();
          isLoading.value = false;
        }
      });
    } catch (error) {
      // todo: handle error
      isLoading.value = false;
    } finally {
      // todo: handle finally
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}
