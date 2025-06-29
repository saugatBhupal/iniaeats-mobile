import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_textstyles.dart';

class AppTheme {
  AppTheme._();

  static getAppTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.mint,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.black,
      ),
    );
    return ThemeData(
      fontFamily: AppFonts.albertSans,
      primaryColor: AppColors.green,
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: AppColors.black),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.green),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        colorScheme: ColorScheme.light(primary: AppColors.green, onPrimary: Colors.white),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.green),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColors.white,
        headerBackgroundColor: AppColors.green,
        todayBackgroundColor: const WidgetStatePropertyAll(AppColors.green),
        todayForegroundColor: const WidgetStatePropertyAll(AppColors.white),
        headerHeadlineStyle: AppTextStyles.titleLarge(color: AppColors.white),
        headerHelpStyle: AppTextStyles.titleSmall(color: AppColors.white),
        dayStyle: AppTextStyles.bodyLarge(color: AppColors.black),
        weekdayStyle: AppTextStyles.bodyLarge(color: AppColors.black),
        confirmButtonStyle: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(AppColors.white),
          backgroundColor: WidgetStateProperty.all(AppColors.green),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
      ),
      textTheme: TextTheme(
        labelSmall: AppTextStyles.labelSmall(color: AppColors.black),
        labelLarge: AppTextStyles.labelLarge(color: AppColors.black),
        bodySmall: AppTextStyles.bodySmall(color: AppColors.black),
        bodyLarge: AppTextStyles.bodyLarge(color: AppColors.black),
        titleSmall: AppTextStyles.titleSmall(color: AppColors.white),
        titleMedium: AppTextStyles.titleMedium(color: AppColors.black),
        titleLarge: AppTextStyles.titleLarge(color: AppColors.black),
        headlineSmall: AppTextStyles.headlineSmall(color: AppColors.black),
        headlineLarge: AppTextStyles.headlineLarge(color: AppColors.black),
        displaySmall: AppTextStyles.displaySmall(color: AppColors.white),
        displayLarge: AppTextStyles.displayLarge(color: AppColors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.chalk,
        hintStyle: const TextStyle(
          color: AppColors.black,
          fontFamily: AppFonts.albertSans,
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: AppColors.green),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: AppColors.red),
        ),
      ),
    );
  }
}
