import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';

ThemeData getDarkThemeData() {
  return ThemeData(
    primaryColor: ColorsManager.darkPrimaryColor,
    // cardColor: Colors.black87,
    cardTheme: CardTheme(
      color: ColorsManager.darkPrimaryColor,
      shadowColor: Colors.black.withValues(alpha: 0.5),
      elevation: 4,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    fontFamily: GoogleFonts.cairo().toString(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.darkPrimaryColor,
      unselectedItemColor: ColorsManager.greyColor,
      selectedIconTheme: IconThemeData(size: 28),
      unselectedIconTheme: IconThemeData(size: 24),
      showUnselectedLabels: true,
    ),

    scaffoldBackgroundColor: ColorsManager.darkScaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.darkAppBarBackgroundColor,
      foregroundColor: ColorsManager.whiteColor,
    ),
    colorScheme: ColorScheme.dark(
      primary: ColorsManager.darkSchemePrimaryColor,
      secondary: ColorsManager.darkSchemeSecondaryColor,
      onPrimary: ColorsManager.whiteColor,
      onSecondary: ColorsManager.blackColor,
    ),
    useMaterial3: true,
  );
}
