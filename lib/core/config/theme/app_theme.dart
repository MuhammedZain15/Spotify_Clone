import 'package:e_commerce/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightBackGroundColor,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      hintStyle: const TextStyle(
        color: Color(0xff383838),

        fontWeight: FontWeight.w500,
      ),
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(25),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r),
        borderSide: const BorderSide(color: Colors.black, width: 0.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r),
        borderSide: const BorderSide(color: Colors.black, width: 0.5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );
  static final darkTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      hintStyle: const TextStyle(
        color: Color(0xffa7a7a7),

        fontWeight: FontWeight.bold,
      ),
      contentPadding: const EdgeInsets.all(25),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r),
        borderSide: const BorderSide(color: Colors.white, width: 0.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r),
        borderSide: const BorderSide(color: Colors.white, width: 0.5),
      ),
    ),
    scaffoldBackgroundColor: AppColors.darkBackGroundColor,
    brightness: Brightness.dark,
    fontFamily: 'Satoshi',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );
}
