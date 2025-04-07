import 'package:chef/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBarTheme{
  MyAppBarTheme._();

  // Light Theme
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark
    ),
    iconTheme: IconThemeData(color: MyColors.black, size: 24.0),
    actionsIconTheme: IconThemeData(color: MyColors.black, size: 24.0),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: MyColors.black),
  );

  // Light Theme
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light
    ),
    iconTheme: IconThemeData(color: MyColors.white, size: 24.0),
    actionsIconTheme: IconThemeData(color: MyColors.white, size: 24.0),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: MyColors.white),
  );
}