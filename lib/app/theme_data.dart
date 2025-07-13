import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppThemeData{
  static ThemeData get lightThemeData{
    return ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.themeColor,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme:const AppBarTheme(
          backgroundColor: Colors.white,
          //elevation: 2,
        ),
        textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize:28,
              fontWeight: FontWeight.w600,
            )
        ),

        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
          contentPadding:
          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: OutlineInputBorder(
            borderSide:
            BorderSide(color: AppColors.themeColor, width: 1),),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: AppColors.themeColor, width: 1),),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: AppColors.themeColor, width: 1),),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.themeColor,
            fixedSize: const Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),


        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.themeColor,
            )
        )

    );
  }

  static ThemeData get darkThemeData{
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.themeColor,
      ),
      //scaffoldBackgroundColor: Colors.grey,
      brightness: Brightness.dark,
    );
  }

  static TextFormField textFormField(String hint, int maxLine,TextEditingController controller,String? Function(String?) validator,TextInputType? keyboardType,{int? maxLength}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLine,
      maxLength: maxLength,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.themeColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.themeColor, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }


}