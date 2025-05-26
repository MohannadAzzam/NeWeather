import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';

ThemeData getLightThemeData() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorsManager.lightPrimaryColor,
    appBarTheme: AppBarTheme(
      // titleTextStyle: GoogleFonts.cairoPlay(),
      // color: ColorsManager.myBlue,
      backgroundColor: ColorsManager.lightAppBarBackgroundColor,
      // centerTitle: true,
      foregroundColor: ColorsManager.whiteColor,
    ),
    // primaryColor: Color(0xff6c63ff),
    colorScheme: ColorScheme.light(
      primary: ColorsManager.lightSchemePrimaryColor,
      secondary: ColorsManager.lightSchemeSecondaryColor,
      onPrimary: ColorsManager.whiteColor,
      onSecondary: ColorsManager.whiteColor,
    ),
    //  ColorScheme.fromSeed(seedColor: ColorsManager.myBlue),
    cardTheme: CardTheme(
      color: ColorsManager.whiteColor,
      shadowColor: Colors.grey.withValues(alpha: 0.3),
      elevation: 4,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    fontFamily: GoogleFonts.cairo().toString(),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.whiteColor,
      selectedItemColor: ColorsManager.lightbtmSelectedColor,
      unselectedItemColor: ColorsManager.greyColor,
      selectedIconTheme: IconThemeData(size: 28.r),
      unselectedIconTheme: IconThemeData(size: 24.r),
      showUnselectedLabels: true,
    ),
  );
}
