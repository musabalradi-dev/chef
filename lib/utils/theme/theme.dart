import 'package:chef/utils/constants/colors.dart';
import 'package:chef/utils/theme/custom_theme/app_bar_theme.dart';
import 'package:chef/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:chef/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:chef/utils/theme/custom_theme/input_decoration_theme.dart';
import 'package:chef/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:chef/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class MyThemeApp {
  MyThemeApp._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    colorSchemeSeed: Colors.orange,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MyTextTheme.lightTextTheme,
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    iconTheme: IconThemeData(color: MyColors.black),
    checkboxTheme: MyCheckboxTheme.lightCheckboxTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MyInputDecorationTheme.lightInputDecorationTheme,
  );

  // dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.orange,
    scaffoldBackgroundColor: Colors.black,
    textTheme: MyTextTheme.darkTextTheme,
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    iconTheme: IconThemeData(color: MyColors.white),
    checkboxTheme: MyCheckboxTheme.darkCheckboxTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MyInputDecorationTheme.darkInputDecorationTheme,
  );
}
