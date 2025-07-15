import 'package:expense_tracker/features/auth/presentation/widgets/app_logo_widget.dart';
import 'package:expense_tracker/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import '../../../../shared/pages/main_bottom_nav_page.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _endTheSplashScreen();
    super.initState();
  }

  Future<void> _endTheSplashScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MainBottomNavScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Center(child: AppLogoWidget()),
          Spacer(),
        ],
      ),
    );
  }
}
