import 'package:chef/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextTheme {
  MyTextTheme._();

  // Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: MyColors.black,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: MyColors.black,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: MyColors.black,
    ),

    titleLarge: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: MyColors.black,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: MyColors.black,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: MyColors.black,
    ),

    bodyLarge: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: MyColors.black,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: MyColors.black,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: MyColors.black.withValues(alpha: 0.5),
    ),

    labelLarge: GoogleFonts.poppins(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: MyColors.black,
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: MyColors.black.withValues(alpha: 0.5),
    ),
  );

  // Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: MyColors.white,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: MyColors.white,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: MyColors.white,
    ),

    titleLarge: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: MyColors.white,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: MyColors.white,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: MyColors.white,
    ),

    bodyLarge: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: MyColors.white,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: MyColors.white,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: MyColors.white.withValues(alpha: 0.5),
    ),

    labelLarge: GoogleFonts.poppins(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: MyColors.white,
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: MyColors.white.withValues(alpha: 0.5),
    ),
  );
}
