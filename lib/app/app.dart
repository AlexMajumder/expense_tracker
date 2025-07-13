import 'package:expense_tracker/app/theme_data.dart';
import 'package:expense_tracker/features/auth/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      home: SplashPage(),
    );
  }
}

