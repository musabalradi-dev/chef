import 'package:chef/feature/core/screens/categories/categories.dart';
import 'package:chef/feature/core/screens/home/home.dart';
import 'package:chef/feature/personalization/screens/settings/settings.dart';
import 'package:chef/utils/constants/colors.dart';
import 'package:chef/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationMenuController());
    final darkMode = HelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected:
              (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? MyColors.black : MyColors.white,
          indicatorColor:
              darkMode
                  ? MyColors.white.withValues(alpha: 0.1)
                  : MyColors.black.withValues(alpha: 0.1),
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'home'.tr),
            NavigationDestination(
              icon: Icon(Iconsax.category),
              label: 'categories'.tr,
            ),

            NavigationDestination(
              icon: Icon(Iconsax.setting),
              label: 'settings'.tr,
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationMenuController extends GetxController {
  static NavigationMenuController get instance => Get.find();

  final RxInt selectedIndex = 0.obs;

  final screens = [HomeScreen(), CategoriesScreen(), SettingsScreen()];
}
