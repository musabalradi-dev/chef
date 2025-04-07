import 'package:chef/feature/authentication/screens/login/login.dart';
import 'package:chef/feature/authentication/screens/on_boarding/on_boarding.dart';
import 'package:chef/feature/personalization/controllers/settings/settings.dart';
import 'package:chef/localization/languages.dart';
import 'package:chef/navigation_menu.dart';
import 'package:chef/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyApp extends StatelessWidget {

  final isStarted = GetStorage().read('onBoarding') ?? true;
  final isLoggedIn = GetStorage().read('token') ?? false;

   MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    final settingsController = Get.put(SettingsController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: settingsController.theme,
      theme: MyThemeApp.lightTheme,
      darkTheme: MyThemeApp.darkTheme,
      home: startScreen(),
      translations: Languages(),
      locale: settingsController.getLocale(),
      fallbackLocale: Locale('en', 'US'),
      transitionDuration: Duration(milliseconds: 500),
      defaultTransition: Transition.cupertino,
    );
  }

  Widget startScreen() {
    if(isStarted == false){
      if(isLoggedIn == null || isLoggedIn == false){
        return LoginScreen();
      }else{
        return NavigationMenu();
      }
    }else{
      return OnBoardingScreen();
    }
  }
}
