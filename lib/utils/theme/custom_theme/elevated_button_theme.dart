import 'package:chef/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MyElevatedButtonTheme {
  MyElevatedButtonTheme._();

  // Light ElevatedButton Theme
  static ElevatedButtonThemeData lightElevatedButtonTheme =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: MyColors.white,
      backgroundColor: MyColors.buttonPrimary,
      disabledForegroundColor: MyColors.grey,
      disabledBackgroundColor: MyColors.grey,
      // side: BorderSide(color: MyColors.buttonPrimary),
      padding: EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(
        fontSize: 16.0,
        color: MyColors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
  );

  // Dark ElevatedButton Theme
  static ElevatedButtonThemeData darkElevatedButtonTheme =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: MyColors.white,
      backgroundColor: MyColors.buttonPrimary,
      disabledForegroundColor: MyColors.grey,
      disabledBackgroundColor: MyColors.grey,
      // side: BorderSide(color: MyColors.buttonPrimary),
      padding: EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(
        fontSize: 16.0,
        color: MyColors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
  );
}
