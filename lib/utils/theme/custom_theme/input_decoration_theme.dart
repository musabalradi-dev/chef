import 'package:chef/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MyInputDecorationTheme {
  MyInputDecorationTheme._();

  // Light InputDecoration Theme
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: MyColors.grey,
    suffixIconColor: MyColors.grey,
    labelStyle: TextStyle().copyWith(fontSize: 14, color: MyColors.black),
    hintStyle: TextStyle().copyWith(fontSize: 14.0, color: MyColors.black),
    errorStyle: TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: TextStyle().copyWith(
      color: MyColors.black.withValues(alpha: 0.8),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: MyColors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: MyColors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: Colors.black12),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 2, color: Colors.orange),
    ),
  );

  // dark InputDecoration Theme
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: MyColors.grey,
    suffixIconColor: MyColors.grey,
    labelStyle: TextStyle().copyWith(fontSize: 14.0, color: MyColors.white),
    hintStyle: TextStyle().copyWith(fontSize: 14.0, color: MyColors.white),
    errorStyle: TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: TextStyle().copyWith(
      color: MyColors.white.withValues(alpha: 0.8),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: MyColors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: MyColors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: MyColors.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 2, color: Colors.orange),
    ),
  );
}
