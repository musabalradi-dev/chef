import 'package:chef/feature/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController{
  static SettingsController get instance => Get.find();

  final deviceStorage = GetStorage();
  final isDarkMode = false.obs;
  final firstName = ''.obs;
  final lastName = ''.obs;
  final emailAddress = ''.obs;

  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;

  bool _loadTheme() => deviceStorage.read('isDarkMode') ?? false;

  void saveTheme(isDarkMode) => deviceStorage.write('isDarkMode', isDarkMode);

  void changeTheme(value) {
    isDarkMode.value = value;
    Get.changeThemeMode(_loadTheme() ? ThemeMode.light : ThemeMode.dark);
    saveTheme(!_loadTheme());
  }

  // Get the saved language from storage or return default (English)
  String get language => deviceStorage.read('language') ?? 'en';

  // Save language to storage
  Future<void> saveLanguage(String languageCode) async {
    await deviceStorage.write('language', languageCode);
  }

  // Get the current locale
  Locale getLocale() {
    return language == 'ar' ? const Locale('ar') : const Locale('en');
  }

  // Change app language
  void changeLanguage(String languageCode) {
    saveLanguage(languageCode);
    Get.updateLocale(Locale(languageCode));
  }

  void logout() {
    deviceStorage.remove('token');
    deviceStorage.remove('firstName');
    deviceStorage.remove('lastName');
    deviceStorage.remove('emailAddress');

    // Clear all other user data if needed
    Get.offAll(() => LoginScreen());

    Get.snackbar(
      'success'.tr,
      'logoutSuccessfully'.tr,
      backgroundColor: Colors.green.shade600,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      borderRadius: 12,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      shouldIconPulse: true,
    );
  }

  @override
  void onInit() {
    isDarkMode.value = deviceStorage.read('isDarkMode') ?? false;
    firstName.value = deviceStorage.read('firstName') ?? '';
    lastName.value = deviceStorage.read('lastName') ?? '';
    emailAddress.value = deviceStorage.read('emailAddress') ?? '';
    super.onInit();
  }
}