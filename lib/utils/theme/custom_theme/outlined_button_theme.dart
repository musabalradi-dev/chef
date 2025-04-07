import 'package:chef/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MyOutlinedButtonTheme {
  MyOutlinedButtonTheme._();

  // Light OutlinedButton Theme
  static OutlinedButtonThemeData lightOutlinedButtonTheme =
  OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      backgroundColor: Colors.transparent,
      disabledForegroundColor: MyColors.grey,
      disabledBackgroundColor: Colors.transparent,
      side: BorderSide(color: MyColors.primary),
      padding: EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(
        fontSize: 16,
        color: MyColors.black,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  // dark OutlinedButton Theme
  static OutlinedButtonThemeData darkOutlinedButtonTheme =
  OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      backgroundColor: Colors.transparent,
      disabledForegroundColor: MyColors.grey,
      disabledBackgroundColor: Colors.transparent,
      side: BorderSide(color: MyColors.white),
      padding: EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(
        fontSize: 16,
        color: MyColors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
