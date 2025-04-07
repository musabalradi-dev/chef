import 'package:chef/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MyCheckboxTheme {
  MyCheckboxTheme._();

  // Light Checkbox Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.selected)) {
        return MyColors.white;
      } else {
        return MyColors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.selected)) {
        return MyColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );

  // dark Checkbox Theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.selected)) {
        return MyColors.white;
      } else {
        return MyColors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.selected)) {
        return MyColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
