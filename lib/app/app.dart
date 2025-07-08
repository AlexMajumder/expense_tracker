import 'package:expense_tracker/feature/common/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

